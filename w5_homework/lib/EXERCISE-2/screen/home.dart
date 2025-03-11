import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w5_homework/EXERCISE-2/provider/count_notifier.dart';
import 'package:w5_homework/EXERCISE-2/screen/color_tap_screen.dart';
import 'package:w5_homework/EXERCISE-2/screen/statistic_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building Home Widget');
    return Consumer<ColorCounters>(
      builder: (context, model, child) {
        return Scaffold(
          body:
              model.currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.currentIndex,
            onTap: (index) => model.setCurrentIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.tap_and_play),
                label: 'Taps',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Statistics',
              ),
            ],
          ),
        );
      },
    );
  }
}
