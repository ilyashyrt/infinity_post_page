import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinity_post_page/comments/constants/comments_textstyles.dart';
import 'package:infinity_post_page/comments/models/comments_model.dart';
import 'package:infinity_post_page/widgets/custom_circle_avatar.dart';

class CommentListItem extends StatelessWidget {
  const CommentListItem({Key? key, required this.comment}) : super(key: key);

  final CommentModel comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: ListTile(
        leading: const CustomCircleAvatar(
          icon: FontAwesomeIcons.comment,
        ),
        title: Text(
          comment.email,
          style: CommentsTextStyles.emailTextStyle,
        ),
        isThreeLine: true,
        subtitle: Text(
          comment.body,
          style: CommentsTextStyles.bodyTextStyle,
        ),
        dense: true,
      ),
    );
  }
}
