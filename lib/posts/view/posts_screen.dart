import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_post_page/posts/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_post_page/posts/view/posts_list.dart';
import 'package:infinity_post_page/widgets/custom_appbar.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar.customAppBar(),
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }

  
}
