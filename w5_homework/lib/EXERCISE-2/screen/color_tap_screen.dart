import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w5_homework/EXERCISE-2/provider/count_notifier.dart';

enum CardType { red, blue }

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Building ColorTapsScreen Widget');
    return Scaffold(
      appBar: AppBar(title: const Text('Color Taps')),
      body: const Column(
        children: [
          ColorTap(type: CardType.red),
          ColorTap(type: CardType.blue),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;

  const ColorTap({
    super.key,
    required this.type,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    print('Building ColorTap Widget: ${type.toString()}');
    return Consumer<ColorCounters>(
      builder: (context, colorCounters, child) {
        // Get the correct tap count based on the card type
        final tapCount = type == CardType.red
            ? colorCounters.redTaps
            : colorCounters.blueTaps;

        return GestureDetector(
          onTap: () {
            // Increment the appropriate counter
            if (type == CardType.red) {
              colorCounters.incrementRed();
            } else {
              colorCounters.incrementBlue();
            }
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            height: 100,
            child: Center(
              child: Text(
                'Taps: $tapCount',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
