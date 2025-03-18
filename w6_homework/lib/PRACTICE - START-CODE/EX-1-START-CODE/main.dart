import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repositories/courses_repository.dart';
import 'screens/course_list_screen.dart';
import 'providers/courses_provider.dart';
import 'repositories/courses_mock_repository.dart';

void main() {
  CoursesRepository repository = CoursesMockRepository();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return CoursesProvider(repository: repository);
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CourseListScreen(),
      ),
    ),
  );
}
