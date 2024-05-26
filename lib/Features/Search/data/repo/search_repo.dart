import 'package:dartz/dartz.dart';
import 'package:library_app/Core/errors/failure.dart';
import '../../../../Core/model/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, BookModel>> featchResultdata(url);
}
