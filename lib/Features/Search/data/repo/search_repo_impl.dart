import 'package:dartz/dartz.dart';
import 'package:library_app/Core/database/apis/apis_consumer.dart';
import 'package:library_app/Core/database/apis/end_points.dart';
import 'package:library_app/Core/errors/error_exception.dart';
import 'package:library_app/Core/errors/failure.dart';
import 'package:library_app/Features/Search/data/repo/search_repo.dart';

import '../../../../Core/model/book_model.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiConsumer api;

  SearchRepoImpl({required this.api});
  @override
  Future<Either<Failure, BookModel>> featchResultdata(url) async {
    try {
      var response = await api.get(EndPoints.endPoint, queryParameters: {
        'Filtering': 'free-ebooks',
        'q': url,
      });
      return right(BookModel.fromJson(response));
    } on ServerException catch (e) {
      return left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
