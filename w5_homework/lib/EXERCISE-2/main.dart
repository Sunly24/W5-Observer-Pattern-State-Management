import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/count_notifier.dart';
import 'screen/home.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ColorCounters(),
        child: const Home(),
      ),
    ),
  );
}
