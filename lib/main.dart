import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_firebase_remote_config/pages/home_page.dart';
import 'package:learn_firebase_remote_config/setup.dart';

Future<void> main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
