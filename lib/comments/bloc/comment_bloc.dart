
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_post_page/comments/models/comments_model.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_post_page/comments/services/comments_services.dart';
import 'package:infinity_post_page/posts/constants/posts_constants.dart';
import 'package:stream_transform/stream_transform.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc({
    required this.httpClient,
    required this.postId,
  }) : super(const CommentState()) {
    on<CommentFetched>(
      onCommentFetched,
      transformer: (events, mapper) =>
          events.throttle(PostsConstants.throttleDuration).switchMap(mapper),
    );
  }
  final http.Client httpClient;
  final int postId;

  Future<void> onCommentFetched(
    CommentFetched event,
    Emitter<CommentState> emit,
  ) async {
    try {
      if (state.status == CommentStatus.loading) {
        final comments = await CommentServices().getComments(postId);
        return emit(state.copyWith(
          status: CommentStatus.success,
          comments: comments,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: CommentStatus.error));
    }
  }
}
