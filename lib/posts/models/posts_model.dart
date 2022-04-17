import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  const PostModel({required this.userId,required this.id, required this.title, required this.body});

  final int userId;
  final int id;
  final String title;
  final String body;

  @override
  List<Object> get props => [userId, id, title, body];
}
