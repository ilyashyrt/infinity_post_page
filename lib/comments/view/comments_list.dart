import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_post_page/comments/bloc/comment_bloc.dart';
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
            return const Center(child: Text('failed to fetch comments'));
          case CommentStatus.success:
            if (state.comments.isEmpty) {
              return const Center(child: Text('no comments'));
            }
            return ListView.builder(
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
