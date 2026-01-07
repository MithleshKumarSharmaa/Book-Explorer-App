import 'package:equatable/equatable.dart';

abstract class FavoriteBookEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFavoriteBook extends FavoriteBookEvent {}

class LoadReadBook extends FavoriteBookEvent {}
