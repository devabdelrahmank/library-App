import '../../../../../Core/model/book_model.dart';

abstract class SearchState {}

class InitialSearchState extends SearchState {}

class LodingSearchState extends SearchState {}

class SuccessSearchState extends SearchState {
  final BookModel bookModel;

  SuccessSearchState(this.bookModel);
}

class ErrorSearchState extends SearchState {
  final String error;

  ErrorSearchState(this.error);
}
