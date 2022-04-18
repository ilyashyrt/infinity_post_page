import 'package:flutter/material.dart';
import 'package:infinity_post_page/comments/models/comments_model.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({Key? key, required this.comment}) : super(key: key);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text('${comment.id}'),
        title: Text(comment.email),
        isThreeLine: true,
        subtitle: Text(comment.body),
        dense: true,
      ),
    );
  }
}