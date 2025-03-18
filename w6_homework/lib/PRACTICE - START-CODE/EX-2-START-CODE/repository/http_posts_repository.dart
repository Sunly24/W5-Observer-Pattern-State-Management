import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/post.dart';
import '../dto/post_dto.dart';
import '../repository/post_repository.dart';

class HttpPostsRepository extends PostRepository {
  final String url = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => PostDto.fromJson(json).toDomain()).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Post fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      description: json['body'],
    );
  }

  @override
  Future<List<Post>> getPosts(int postId) {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
