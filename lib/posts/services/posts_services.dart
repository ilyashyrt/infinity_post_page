import 'dart:convert';

import 'package:infinity_post_page/constants/app_strings.dart';
import 'package:infinity_post_page/posts/constants/posts_constants.dart';
import 'package:infinity_post_page/posts/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostServices{
  final http.Client httpClient = http.Client();
  Future<List<PostModel>> getPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        AppStrings.baseUrl,
        PostsConstants.postsText,
        <String, String>{
          PostsConstants.startText: '$startIndex',
          PostsConstants.limitText: '${PostsConstants.postLimit}'
        },
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return PostModel(
          userId: json['userId'] as int,
          id: json['id'] as int,
          title: json['title'] as String,
          body: json['body'] as String,
        );
      }).toList();
    }
    throw Exception(AppStrings.errorText);
  }
}