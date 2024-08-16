import 'package:flutter/material.dart';
import 'package:text_plus/text_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Text Plus Example'),
        ),
        body: const Center(
          child: TextPlus(
            'This is **bold**, *italic*, _underline_, ~strikethrough~ and [colored](red) text.',
          ),
        ),
      ),
    );
  }
}
