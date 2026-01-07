## Book Explorer App (Flutter)

A Flutter application that allows users to explore books, view book details, mark books as Favorite and Read, with offline persistence using Hive and clean state management using flutter_bloc.

- Features
- Book listing screen
- Book details screen
- Favorite Books screen
- Mark / Remove Favorite
- Mark book as Read
- Offline local storage using Hive
- API integration using HTTP
- Network image caching using CachedNetworkImage
- Scalable architecture with BLoC + Equatable

## App Architecture

The app follows Clean Architecture inspired layered structure:

- lib
  - data
    - data_sources
    - local_models
    - models
    - repositories
  - presentation
    - bloc
      - book_detail
      - book_list
      - local
    - screens
    - widgets
  - utils

## BLoC flow (events → states)

# Events

abstract class BookEvent extends Equatable {}

class FetchBooks extends BookEvent {}

class ToggleFavorite extends BookEvent {
final Book book;
}

class MarkAsRead extends BookEvent {
final Book book;
}

# State

abstract class BookState extends Equatable {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
final List<Book> books;
}

class BookError extends BookState {
final String message;
}

# bloc Flow

UI Action
↓
BookEvent
↓
BookBloc
↓
Repository
↓
API / Hive
↓
BookState
↓
UI Update

## How local state is handled

How Local State is Handled (Hive + BLoC)

Hive: Stores favorite/read status using a unique key (id or title+author+isbn). Boxes opened in main.dart.

BLoC: Manages all logic (toggle favorite/read, fetch books). Events: FavoriteBookEvent, LoadFavoriteBookEvent, LoadReadBookEvent. States:FavoriteBookInitial FavoriteBookLoading, FavoriteBookSuccess, FavoriteBookError.

Sync: Book List reads Hive + BLoC; Book Detail toggles status → updates Hive → List updates automatically.

## Trade-offs and improvements

# Trade-offs

- No pagination (can affect performance with large data)
- Single BLoC for simplicity
- No unit tests included (time constraint)

# Possible Improvements

- Add pagination / infinite scroll
- Add search & filter
- Introduce separate BLoCs (FavoritesBloc)
- Migrate to Dio for advanced networking
- Use Freezed for immutable models

<!------------------------------------------------------------------------------>

Note: This API’s "id" stays the same, but only the content is changing. So I initially set the local state using the API response "id" and I also got a unique "isbn". Later, I discussed with the sir, and he said to use "id", so I used "id" instead.

Tip: Tip: I can also create a truly unique ID myself using methods like:

- UUID
- DateTime.now()
- Combination like title + author + id

Here, if you want, you can generate your own unique ID instead of relying on the API’s ID.

<!-- =============================== Thank You =============================== -->
