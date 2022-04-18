// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinity_post_page/comments/bloc/comment_bloc.dart';
import 'package:infinity_post_page/posts/bloc/post_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_post_page/posts/view/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (_) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MultiBlocProvider(
              child: const PostsScreen(),
              providers: [
                BlocProvider(
                  create: (context) =>
                      PostBloc(httpClient: http.Client())..add(PostFetched()),
                ),
                BlocProvider(
                    create: (context) => CommentBloc(httpClient: http.Client())
                      ..add(CommentFetched()))
              ],
            )));
  }
}
