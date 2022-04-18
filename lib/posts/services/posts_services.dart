import 'dart:convert';

import 'package:infinity_post_page/posts/constants/posts_constants.dart';
import 'package:infinity_post_page/posts/models/posts_model.dart';
import 'package:http/http.dart' as http;

class PostServices{
  final http.Client httpClient = http.Client();
  Future<List<PostModel>> getPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{
          '_start': '$startIndex',
          '_limit': '${PostsConstants.postLimit}'
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
    throw Exception('Error');
  }
}