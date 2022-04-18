import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  const CommentModel(
      {required this.postId,
      required this.id,
      required this.name,
      required this.email,
      required this.body});

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  @override
  List<Object> get props => [postId, id, name, email, body];
}
