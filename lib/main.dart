import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:take_home/app.dart';
import 'package:take_home/data/data_sources/book_local_data_source.dart';
import 'package:take_home/data/data_sources/book_remote_data_source.dart';
import 'package:take_home/data/local_models/book_local_model.dart';
import 'package:take_home/data/repositories/book_repository.dart';
import 'package:take_home/presentation/bloc/book_list/book_list_bloc.dart';
import 'package:take_home/presentation/bloc/book_list/book_list_event.dart';
import 'package:take_home/presentation/bloc/local/favorite_book_bloc.dart';
import 'package:take_home/presentation/bloc/local/favorite_book_event.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BookLocalModelAdapter());
  await Hive.openBox<BookLocalModel>('books');

  final bookRepository = BookRepository(
    BookRemoteDataSource(),
    BookLocalDataSource(),
  );

  runApp(
    RepositoryProvider<BookRepository>(
      create: (_) => bookRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => BookListBloc(bookRepository)..add(FetchBooks()),
          ),
          BlocProvider(
            create: (_) =>
                FavoriteBookBloc(bookRepository)..add(LoadFavoriteBook()),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}
