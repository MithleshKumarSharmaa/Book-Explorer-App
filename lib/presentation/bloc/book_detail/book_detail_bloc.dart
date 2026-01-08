import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/data/repositories/book_repository.dart';
import 'book_detail_event.dart';
import 'book_detail_state.dart';

class BookDetailBloc extends Bloc<BookDetailEvent, BookDetailState> {
  final BookRepository repo;

  BookDetailBloc(this.repo) : super(BookDetailInitial()) {
    on<LoadBookDetail>((event, emit) {
      emit(BookDetailLoading());

      final updatedBook = repo.loadLocalState(event.book);

      emit(BookDetailUpdated(updatedBook));
    });

    on<ToggleFavorite>((event, emit) async {
      final updatedBook = await repo.toggleFavorite(event.book);

      emit(BookDetailUpdated(updatedBook));
    });

    on<ToggleRead>((event, emit) async {
      final updatedBook = await repo.toggleRead(event.book);

      emit(BookDetailUpdated(updatedBook));
    });
  }
}
