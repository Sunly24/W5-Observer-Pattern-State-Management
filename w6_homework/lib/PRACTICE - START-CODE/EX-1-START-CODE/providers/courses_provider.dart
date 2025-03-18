import 'package:flutter/material.dart';

import '../models/course.dart';
import '../repositories/courses_repository.dart';

class CoursesProvider extends ChangeNotifier {
  final CoursesRepository repository;
  List<Course> _courses = [];
  List<Course> get courses => _courses;

  CoursesProvider({required this.repository}) {
    fetchCourses();
  }

  void fetchCourses() {
    _courses = repository.getCourses();
    notifyListeners();
  }

  Course? getCourseFor(String courseId) {
    return _courses.firstWhere((c) => c.name == courseId);
  }

  void addScore(String courseId, CourseScore score) {
    Course? course = getCourseFor(courseId);

    if (course != null) {
      repository.addScore(course, score);
      notifyListeners();
    }
  }
}
