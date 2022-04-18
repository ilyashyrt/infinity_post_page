import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinity_post_page/posts/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_post_page/posts/view/posts_list.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Icon(
          FontAwesomeIcons.twitter,
          color: Colors.blue,
        ),
        bottom: PreferredSize(
            child: Container(
              color: Colors.white,
              height: 0.15,
            ),
            preferredSize: const Size.fromHeight(4.0)),
      ),
      body: BlocProvider(
        create: (_) => PostBloc(httpClient: http.Client())..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
