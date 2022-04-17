// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) =>
              PostBloc(httpClient: http.Client())..add(PostFetched()),
          child: const PostsScreen(),
        ));
  }
}
