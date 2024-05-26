import '../../../../../Core/model/book_model.dart';

abstract class GoodBookState {}

class InitialGoodBookState extends GoodBookState {}

class LoadingGoodBookState extends GoodBookState {}

class SuccessGoodBookState extends GoodBookState {
  final BookModel bookModel2;

  SuccessGoodBookState({required this.bookModel2});
}

class ErrorGoodBookState extends GoodBookState {
  final String error;
  ErrorGoodBookState({required this.error});
}
