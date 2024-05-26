import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failure.dart';
import '../../../../Core/model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, BookModel>> getBestSellerBook();
  Future<Either<Failure, BookModel>> getGoodBook();
  Future<Either<Failure, BookModel>> getCombleteBook();
}
