import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_post_page/comments/bloc/comment_bloc.dart';
import 'package:infinity_post_page/comments/view/comments_list.dart';
import 'package:infinity_post_page/posts/models/posts_model.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_post_page/posts/widgets/post_list_item.dart';
import 'package:infinity_post_page/utils/device_utils.dart';
import 'package:infinity_post_page/widgets/custom_appbar.dart';

class CommentsScreen extends StatefulWidget {
  final List<PostModel> postModel;
  final int index;
  final int postId;
  const CommentsScreen(
      {Key? key,
      required this.postModel,
      required this.index,
      required this.postId})
      : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar.customAppBar(),
      body: BlocProvider(
        create: (_) =>
            CommentBloc(httpClient: http.Client(), postId: widget.postId)
              ..add(CommentFetched()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              child: PostListItem(
                  post: widget.postModel[widget.index], color: Colors.blue),
            ),
            Expanded(
              child: SizedBox(
                child: const CommentsList(),
                height: DeviceUtils.getScaledHeight(context, 0.6),
              ),
            ),
          ],
        ),
        /*child: Column(children: [
          
          
        ]),*/
      ),
    );
  }
}
