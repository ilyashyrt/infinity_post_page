import 'package:flutter/material.dart';
import 'package:infinity_post_page/posts/models/posts_model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post, this.onTap}) : super(key: key);

  final PostModel post;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: Text('${post.id}'),
          title: Text(post.title),
          isThreeLine: true,
          subtitle: Text(post.body),
          dense: true,
        ),
      ),
    );
  }
}
