import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/courses_provider.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  final String courseId;
  const CourseScreen({super.key, required this.courseId});

  void _addScore(BuildContext context) async {
    CourseScore? newSCore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );

    if (newSCore != null) {
      Provider.of<CoursesProvider>(context, listen: false)
          .addScore(courseId, newSCore);
    }
  }

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    Course? course =
        Provider.of<CoursesProvider>(context).getCourseFor(courseId);
    Widget content = const Center(child: Text('No Scores added yet.'));

    if (course != null && course.scores.isNotEmpty) {
      content = ListView.builder(
        itemCount: course.scores.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(course.scores[index].studentName),
          trailing: Text(
            course.scores[index].studenScore.toString(),
            style: TextStyle(
              color: scoreColor(course.scores[index].studenScore),
              fontSize: 15,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          courseId,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () => _addScore(context), icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
}
