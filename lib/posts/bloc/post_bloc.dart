import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinity_post_page/posts/constants/posts_constants.dart';
import 'package:infinity_post_page/posts/models/posts_model.dart';
import 'package:http/http.dart' as http;
import 'package:stream_transform/stream_transform.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.httpClient}) : super(const PostState()) {
    on<PostFetched>(
      onPostFetched,
      transformer: (events, mapper) =>
          events.throttle(PostsConstants.throttleDuration).switchMap(mapper),
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
        final posts = await getPosts();
        return emit(state.copyWith(
          status: PostStatus.success,
          posts: posts,
          hasMax: false,
        ));
      }
      final posts = await getPosts(state.posts.length);
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

  Future<List<PostModel>> getPosts([int startIndex = 0]) async {
    final response = await httpClient.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{
          '_start': '$startIndex',
          '_limit': '${PostsConstants.postLimit}'
        },
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((dynamic json) {
        return PostModel(
          userId: json['userId'] as int,
          id: json['id'] as int,
          title: json['title'] as String,
          body: json['body'] as String,
        );
      }).toList();
    }
    throw Exception('Error');
  }
}
