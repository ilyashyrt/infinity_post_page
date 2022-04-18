import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinity_post_page/posts/models/posts_model.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post, this.onTap})
      : super(key: key);

  final PostModel post;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.black.withOpacity(0.8),
        child: ListTile(
          leading: const Padding(
            padding: EdgeInsets.all(5.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          title: Text(
            post.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          isThreeLine: true,
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              post.body,
              style: TextStyle(color: Colors.white.withOpacity(0.8)),
            ),
          ),
          dense: true,
        ),
      ),
    );
  }
}
