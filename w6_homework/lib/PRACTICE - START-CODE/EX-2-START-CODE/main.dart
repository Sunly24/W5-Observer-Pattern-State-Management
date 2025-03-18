import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repository/http_posts_repository.dart';
import 'repository/post_repository.dart';
import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
  // 1 - Create the repository
  PostRepository postRepo = HttpPostsRepository();

  // 2 - Run the app
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: postRepo),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}
