import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPosts(int postId) {
    return Future.delayed(const Duration(seconds: 5), () {
      if (postId != 25) {
        throw Exception("No post found");
      }
      return [
        Post(
          id: 25,
          title: 'Who is the best',
          description: 'teacher ronan',
        ),
        Post(
          id: 26,
          title: 'Who is the best',
          description: 'teacher ronan',
        ),
      ];
    });
  }

  @override
  Future<List<Post>> fetchPosts() {
    // TODO: implement fetchPosts
    throw UnimplementedError();
  }
}
