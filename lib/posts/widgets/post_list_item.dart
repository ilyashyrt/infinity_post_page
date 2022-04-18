import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinity_post_page/posts/constants/posts_textstyles.dart';
import 'package:infinity_post_page/posts/models/posts_model.dart';
import 'package:infinity_post_page/widgets/custom_circle_avatar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post, this.onTap, this.color})
      : super(key: key);

  final PostModel post;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: color ?? Colors.black.withOpacity(0.8),
        child: ListTile(
          leading: const CustomCircleAvatar(
            icon: FontAwesomeIcons.user,
          ),
          title: Text(post.title,
              style: PostsTextStyles.titleTextStyle),
          isThreeLine: true,
          subtitle: Padding(
            padding: EdgeInsets.only(top: 5.r),
            child: Text(
              post.body,
              style: PostsTextStyles.bodyTextStyle,
            ),
          ),
          dense: true,
        ),
      ),
    );
  }
}
