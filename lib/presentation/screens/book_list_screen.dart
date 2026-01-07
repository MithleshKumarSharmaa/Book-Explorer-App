import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/presentation/bloc/book_list/book_list_bloc.dart';
import 'package:take_home/presentation/bloc/book_list/book_list_event.dart';
import 'package:take_home/presentation/bloc/book_list/book_list_state.dart';
import 'package:take_home/presentation/screens/book_detail_screen.dart';
import 'package:take_home/presentation/screens/favorite_book_screen.dart';
import 'package:take_home/presentation/widgets/book_item.dart';
import 'package:take_home/presentation/widgets/empty_view.dart';
import 'package:take_home/presentation/widgets/error_view.dart';
import 'package:take_home/utils/app_colors.dart';

class BookListScreen extends StatelessWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Book Explorer',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.redAccent),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => FavoriteBookScreen()),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<BookListBloc, BookListState>(
        builder: (context, state) {
          if (state is BookListLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state is BookListSuccess) {
            return RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () async {
                context.read<BookListBloc>().add(FetchBooks());
              },
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: state.books.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final book = state.books[index];
                  return BookItem(
                    book: book,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetailScreen(book: book),
                        ),
                      ).then((_) {
                        context.read<BookListBloc>().add(FetchBooks());
                      });
                    },
                  );
                },
              ),
            );
          }

          if (state is BookListEmpty) {
            return const EmptyView();
          }

          if (state is BookListError) {
            return ErrorView(
              message: state.message,
              onPressed: () {
                context.read<BookListBloc>().add(FetchBooks());
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
