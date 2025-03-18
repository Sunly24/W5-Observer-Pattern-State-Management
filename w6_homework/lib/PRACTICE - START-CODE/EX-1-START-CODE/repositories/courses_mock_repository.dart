import '../models/course.dart';
import 'courses_repository.dart';

class CoursesMockRepository extends CoursesRepository {
  @override
  void addScore(Course course, CourseScore score) {
    course.addScore(score);
  }

  @override
  List<Course> getCourses() {
    return [
      Course(name: 'HTML'),
      Course(name: 'JAVA'),
    ];
  }
}
