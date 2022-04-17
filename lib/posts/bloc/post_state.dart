part of 'post_bloc.dart';

enum PostStatus { loading, success, error }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.loading,
    this.posts = const <PostModel>[],
    this.hasMax = false,
  });

  final PostStatus status;
  final List<PostModel> posts;
  final bool hasMax;

  PostState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
    bool? hasMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasMax: hasMax ?? this.hasMax,
    );
  }


  @override
  List<Object> get props => [status, posts, hasMax];
}
