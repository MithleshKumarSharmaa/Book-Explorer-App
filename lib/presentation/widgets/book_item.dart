import 'package:flutter/material.dart';
import 'package:take_home/data/models/book_model.dart';
import 'package:take_home/presentation/widgets/book_image.dart';

class BookItem extends StatelessWidget {
  final BookModel book;
  final VoidCallback onTap;

  const BookItem({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: BookImage(
          imageUrl: book.image,
          width: 50,
          height: 70,
          iconSize: 40,
        ),
        title: Text(
          book.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          book.author,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (book.isFavorite)
              const Icon(Icons.favorite, color: Colors.red, size: 18),

            if (book.isRead) const SizedBox(width: 6),

            if (book.isRead)
              const Icon(Icons.check_circle, color: Colors.green, size: 18),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
