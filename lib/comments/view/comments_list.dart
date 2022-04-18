import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_post_page/comments/bloc/comment_bloc.dart';
import 'package:infinity_post_page/comments/constants/comments_strings.dart';
import 'package:infinity_post_page/comments/widgets/comment_list_item.dart';

class CommentsList extends StatefulWidget {
  const CommentsList({Key? key}) : super(key: key);

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        switch (state.status) {
          case CommentStatus.error:
            return const Center(child: Text(CommentsConstants.failedText));
          case CommentStatus.success:
            if (state.comments.isEmpty) {
              return const Center(child: Text(CommentsConstants.noCommentsText));
            }
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.white,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return index >= state.comments.length
                    ? const CircularProgressIndicator()
                    : CommentListItem(
                        comment: state.comments[index],
                      );
              },
              itemCount: state.comments.length,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
