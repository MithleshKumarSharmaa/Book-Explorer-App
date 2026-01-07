import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/data/repositories/book_repository.dart';
import 'package:take_home/presentation/bloc/local/favorite_book_event.dart';
import 'package:take_home/presentation/bloc/local/favorite_book_state.dart';

class FavoriteBookBloc extends Bloc<FavoriteBookEvent, FavoriteBookState> {
  final BookRepository repo;

  FavoriteBookBloc(this.repo) : super(FavoriteBookInitial()) {
    on<LoadFavoriteBook>((event, emit) async {
      emit(FavoriteBookLoading());
      try {
        final allLocalBooks = await repo.getLocalBooks();
        final favoriteBooks = allLocalBooks
            .where((book) => book.isFavorite)
            .toList();

        if (favoriteBooks.isEmpty) {
          emit(FavoriteBooksEmpty());
        } else {
          emit(FavoriteBookSuccess(favoriteBooks));
        }
      } catch (e) {
        emit(FavoriteBookError(e.toString()));
      }
    });

    on<LoadReadBook>((event, emit) async {
      emit(FavoriteBookLoading());
      try {
        final allLocalBooks = await repo.getLocalBooks();
        final readBooks = allLocalBooks.where((book) => book.isRead).toList();

        if (readBooks.isEmpty) {
          emit(FavoriteBooksEmpty());
        } else {
          emit(FavoriteBookSuccess(readBooks));
        }
      } catch (e) {
        emit(FavoriteBookError(e.toString()));
      }
    });
  }
}
