import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/data/models/book_model.dart';
import 'package:take_home/presentation/bloc/book_detail/book_detail_bloc.dart';
import 'package:take_home/presentation/bloc/book_detail/book_detail_event.dart';
import 'package:take_home/presentation/bloc/book_detail/book_detail_state.dart';
import 'package:take_home/presentation/widgets/book_image.dart';
import 'package:take_home/utils/app_colors.dart';

class BookDetailScreen extends StatelessWidget {
  final BookModel book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookDetailBloc(context.read()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text(
            'Book Details',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primary,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
          ),
        ),
        body: BlocBuilder<BookDetailBloc, BookDetailState>(
          builder: (context, state) {
            final currentBook = state is BookDetailUpdated ? state.book : book;

            return SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: BookImage(
                        imageUrl: currentBook.image,
                        // height: 160,
                        iconSize: 120,
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      currentBook.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),
                    Text('Author: ${currentBook.author}'),
                    Text('Genre: ${currentBook.genre}'),

                    const SizedBox(height: 16),
                    Text(currentBook.description),

                    const SizedBox(height: 16),
                    Text('Publisher: ${currentBook.publisher}'),
                    Text('Published: ${currentBook.published}'),
                    Text('ISBN: ${currentBook.isbn}'),

                    const SizedBox(height: 24),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: currentBook.isFavorite
                                ? Colors.redAccent
                                : Colors.grey[200],
                            foregroundColor: currentBook.isFavorite
                                ? Colors.white
                                : Colors.black87,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                          ),
                          icon: Icon(
                            currentBook.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 22,
                          ),
                          label: Text(
                            currentBook.isFavorite
                                ? 'Remove Favorite'
                                : 'Mark as Favorite',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            context.read<BookDetailBloc>().add(
                              ToggleFavorite(currentBook),
                            );
                          },
                        ),

                        const SizedBox(height: 16),

                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: currentBook.isRead
                                ? Colors.green
                                : Colors.grey[200],
                            foregroundColor: currentBook.isRead
                                ? Colors.white
                                : Colors.black87,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3,
                          ),
                          icon: Icon(
                            currentBook.isRead
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            size: 22,
                          ),
                          label: Text(
                            currentBook.isRead
                                ? 'Marked as Read'
                                : 'Mark as Read',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            context.read<BookDetailBloc>().add(
                              ToggleRead(currentBook),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
