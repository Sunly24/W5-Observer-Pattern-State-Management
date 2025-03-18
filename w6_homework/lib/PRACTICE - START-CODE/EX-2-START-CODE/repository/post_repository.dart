import '../model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts(int postId);
  Future<List<Post>> fetchPosts();
}
