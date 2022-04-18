import 'dart:convert';

import 'package:infinity_post_page/comments/constants/comments_strings.dart';
import 'package:infinity_post_page/comments/models/comments_model.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_post_page/constants/app_strings.dart';

class CommentServices{
  final http.Client httpClient = http.Client();
  Future<List<CommentModel>> getComments(int postId) async {
    final response = await httpClient.get(
      Uri.https(
        AppStrings.baseUrl,
        CommentsConstants.commentsText,
        <String, String>{
          CommentsConstants.postIdText: '$postId',
        },
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return CommentModel(
          postId: json['postId'] as int,
          id: json['id'] as int,
          name: json['name'] as String,
          email: json['email'] as String,
          body: json['body'] as String,
        );
      }).toList();
    }
    throw Exception(AppStrings.errorText);
  }
}