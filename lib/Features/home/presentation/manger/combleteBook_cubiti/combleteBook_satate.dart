import '../../../../../Core/model/book_model.dart';

abstract class CombleteBookState {}

class InitialCombleteBookState extends CombleteBookState {}

class LoadingCombleteBookState extends CombleteBookState {}

class SuccessCombleteBookState extends CombleteBookState {
  final BookModel bookModel;

  SuccessCombleteBookState({required this.bookModel});
}

class ErrorCombleteBookState extends CombleteBookState {
  final String error;
  ErrorCombleteBookState({required this.error});
}
