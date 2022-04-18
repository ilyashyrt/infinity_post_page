
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_post_page/constants/app_strings.dart';
import 'package:infinity_post_page/posts/models/posts_model.dart';
import 'package:http/http.dart' as http;
import 'package:infinity_post_page/posts/services/posts_services.dart';
import 'package:stream_transform/stream_transform.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(
      onPostFetched,
      transformer: (events, mapper) =>
          events.throttle(AppStrings.throttleDuration).switchMap(mapper),
    );
  }

  final http.Client httpClient;

  Future<void> onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    if (state.hasMax) return;
    try {
      if (state.status == PostStatus.loading) {
        final posts = await PostServices().getPosts();
        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasMax: false,
        ));
      }
      final posts = await PostServices().getPosts(state.posts.length);
      posts.isEmpty
          ? emit(state.copyWith(hasMax: true))
          : emit(
              state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: PostStatus.error));
    }
  }
}
