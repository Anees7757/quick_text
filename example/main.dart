import 'package:flutter/material.dart';
import 'package:quick_text/quick_text.dart';

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
          title: const Text('QuickText Example'),
        ),
        body: const Center(
          child: QuickText(
            'This is **bold**, *italic*, _underline_, ~strikethrough~ and [colored](red) text.',
          ),
        ),
      ),
    );
  }
}
