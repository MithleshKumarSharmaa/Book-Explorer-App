import 'package:hive/hive.dart';
import 'package:take_home/data/local_models/book_local_model.dart';

class BookLocalDataSource {
  Box<BookLocalModel> get box => Hive.box<BookLocalModel>('books');

  Future<void> saveBook(BookLocalModel book) async {
    await box.put(book.id, book);
  }

  Future<void> updateBookStatus(
    int id, {
    bool? isFavorite,
    bool? isRead,
  }) async {
    final book = box.get(id);
    if (book != null) {
      final updatedBook = book.copyWith(
        isFavorite: isFavorite ?? book.isFavorite,
        isRead: isRead ?? book.isRead,
      );
      await box.put(id, updatedBook);
    }
  }

  List<BookLocalModel> getAllBooks() {
    return box.values.toList();
  }

  BookLocalModel? getBook(int id) {
    return box.get(id);
  }

  Future<void> deleteBook(int id) async {
    await box.delete(id);
  }

  // if (!updatedBook.isFavorite && !updatedBook.isRead) {
  //   await box.delete(id);
  // } else {
  //   await box.put(id, updatedBook);
  // }
}
