import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/presentation/bloc/local/favorite_book_bloc.dart';
import 'package:take_home/presentation/bloc/local/favorite_book_event.dart';
import 'package:take_home/presentation/bloc/local/favorite_book_state.dart';
import 'package:take_home/presentation/screens/book_detail_screen.dart';
import 'package:take_home/presentation/widgets/book_item.dart';
import 'package:take_home/presentation/widgets/empty_view.dart';
import 'package:take_home/presentation/widgets/error_view.dart';
import 'package:take_home/utils/app_colors.dart';

class FavoriteBookScreen extends StatelessWidget {
  const FavoriteBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteBookBloc>().add(LoadFavoriteBook());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Favorite Books',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
        ),
      ),
      body: BlocBuilder<FavoriteBookBloc, FavoriteBookState>(
        builder: (context, state) {
          if (state is FavoriteBookLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FavoriteBookSuccess) {
            return RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () async {
                context.read<FavoriteBookBloc>().add(LoadFavoriteBook());
              },
              child: ListView.builder(
                 padding: const EdgeInsets.all(8),
                itemCount: state.books.length,
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
                        context.read<FavoriteBookBloc>().add(
                          LoadFavoriteBook(),
                        );
                      });
                    },
                  );
                },
              ),
            );
          }

          if (state is FavoriteBooksEmpty) {
            return const EmptyView();
          }

          if (state is FavoriteBookError) {
            return ErrorView(
              message: state.message,
              onPressed: () {
                context.read<FavoriteBookBloc>().add(LoadFavoriteBook());
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
