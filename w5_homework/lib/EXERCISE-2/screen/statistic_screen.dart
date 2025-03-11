import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w5_homework/EXERCISE-2/provider/count_notifier.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building StatisticsScreen Widget');
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Center(
        child: Consumer<ColorCounters>(
          builder: (context, colorCounters, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Red Taps: ${colorCounters.redTaps}',
                    style: const TextStyle(fontSize: 24)),
                Text('Blue Taps: ${colorCounters.blueTaps}',
                    style: const TextStyle(fontSize: 24)),
              ],
            );
          },
        ),
      ),
    );
  }
}
