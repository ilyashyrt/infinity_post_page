part of 'comment_bloc.dart';

enum CommentStatus { loading, success, error }

class CommentState extends Equatable {
  const CommentState({
    this.status = CommentStatus.loading,
    this.comments = const <CommentModel>[],
  });

  final CommentStatus status;
  final List<CommentModel> comments;

  CommentState copyWith({
    CommentStatus? status,
    List<CommentModel>? comments,
  }) {
    return CommentState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object> get props => [status, comments];
}
