import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_post_page/comments/view/comments_screen.dart';
import 'package:infinity_post_page/posts/bloc/post_bloc.dart';
import 'package:infinity_post_page/posts/constants/posts_constants.dart';
import 'package:infinity_post_page/posts/widgets/custom_loader.dart';
import 'package:infinity_post_page/posts/widgets/post_list_item.dart';

class PostsList extends StatefulWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.error:
            return const Center(child: Text(PostsConstants.failedText));
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text(PostsConstants.noPostsText));
            }
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.white,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return index >= state.posts.length
                    ? const CustomLoader()
                    : PostListItem(
                        post: state.posts[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CommentsScreen(
                                        postModel: state.posts,
                                        index: index,
                                        postId: state.posts[index].id,
                                      )));
                        },
                      );
              },
              itemCount:
                  state.hasMax ? state.posts.length : state.posts.length + 1,
              controller: scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(onScroll)
      ..dispose();
    super.dispose();
  }

  void onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
