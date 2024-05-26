import 'package:dartz/dartz.dart';
import 'package:library_app/Core/database/apis/end_points.dart';
import 'package:library_app/Core/errors/failure.dart';
import 'package:library_app/Features/home/data/repo/home_repo.dart';
import '../../../../Core/database/apis/apis_consumer.dart';
import '../../../../Core/errors/error_exception.dart';
import '../../../../Core/model/book_model.dart';

class HomeRepoImp extends HomeRepo {
  final ApiConsumer api;

  HomeRepoImp({required this.api});

  @override
  Future<Either<Failure, BookModel>> getBestSellerBook() async {
    try {
      var response = await api.get(
        EndPoints.endPoint,
        queryParameters: {
          'Filtering': 'free-ebooks',
          'q': 'anime',
        },
      );

      return right(BookModel.fromJson(response));
    } on ServerException catch (e) {
      return left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, BookModel>> getCombleteBook() async {
    try {
      var response = await api.get(
        EndPoints.endPoint,
        queryParameters: {
          'Filtering': 'free-ebooks',
          'q': 'all-anime',
        },
      );
      return right(BookModel.fromJson(response));
    } on ServerException catch (e) {
      return left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, BookModel>> getGoodBook() async {
    try {
      var response = await api.get(
        EndPoints.endPoint,
        queryParameters: {
          'Filtering': 'free-ebooks',
          'q': 'anime-top',
        },
      );
      return right(BookModel.fromJson(response));
    } on ServerException catch (e) {
      return left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
