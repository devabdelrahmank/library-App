// ignore_for_file: camel_case_types

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Features/home/presentation/manger/combleteBook_cubiti/combleteBook_satate.dart';
import 'package:library_app/Features/home/data/repo/home_repo.dart';

class CombleteBookCubit extends Cubit<CombleteBookState> {
  CombleteBookCubit(this.homeRepo) : super(InitialCombleteBookState());
  static CombleteBookCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  Future<void> getCombleteBook() async {
    final result = await homeRepo.getCombleteBook();
    result.fold(
      (failure) {
        emit(ErrorCombleteBookState(error: failure.errMessage));
      },
      (books) {
        emit(SuccessCombleteBookState(bookModel: books));
      },
    );
  }
}
