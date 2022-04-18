import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_post_page/comments/bloc/comment_bloc.dart';
import 'package:infinity_post_page/comments/view/comments_list.dart';
import 'package:infinity_post_page/posts/models/posts_model.dart';
import 'package:http/http.dart' as http;

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
      body: BlocProvider(
        create: (_) =>
            CommentBloc(httpClient: http.Client(), postId: widget.postId)
              ..add(CommentFetched()),
        child: const CommentsList(),
        /*child: Column(children: [
          PostListItem(post: widget.postModel[widget.index]),
          
        ]),*/
      ),
    );
  }
}
