import 'package:flutter/material.dart';

void main(){
  runApp(const InkHavenApp());
}


class InkHavenApp extends StatelessWidget {
  const InkHavenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class InkHavenInitialApp extends StatelessWidget {
  const InkHavenInitialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}