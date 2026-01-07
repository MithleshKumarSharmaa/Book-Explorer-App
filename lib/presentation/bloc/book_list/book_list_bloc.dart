import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/data/repositories/book_repository.dart';
import 'package:take_home/presentation/bloc/book_list/book_list_event.dart';
import 'package:take_home/presentation/bloc/book_list/book_list_state.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState> {
  final BookRepository repo;

  BookListBloc(this.repo) : super(BookListLoading()) {
    on<FetchBooks>((event, emit) async {
      emit(BookListLoading());
      try {
        final books = await repo.getBooks();

        if (books.isEmpty) {
          emit(BookListEmpty());
        } else {
          emit(BookListSuccess(books));
        }
      } catch (e) {
        emit(BookListError(e.toString()));
      }
    });
  }
}
