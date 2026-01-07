import 'package:flutter/material.dart';
import 'package:take_home/presentation/screens/book_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book-Explorer-App',
      debugShowCheckedModeBanner: false,
      home: BookListScreen(),
    );
  }
}
