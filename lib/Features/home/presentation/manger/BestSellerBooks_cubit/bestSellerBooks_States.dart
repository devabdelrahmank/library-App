import '../../../../../Core/model/book_model.dart';

abstract class BestBookState {}

class InitialBestBookState extends BestBookState {}

class LoadingBestBookState extends BestBookState {}

class SuccessBestBookState extends BestBookState {
  final BookModel bookModel;

  SuccessBestBookState({required this.bookModel});
}

class ErrorBestBookState extends BestBookState {
  final String error;
  ErrorBestBookState({required this.error});
}
