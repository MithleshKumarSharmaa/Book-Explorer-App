import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.menu_book, size: 64, color: Colors.grey),
          SizedBox(height: 12),
          Text('No books available', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
