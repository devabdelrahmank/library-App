// ignore_for_file: camel_case_types

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Features/home/presentation/manger/goodbook_cubit/goodbook_state.dart';
import 'package:library_app/Features/home/data/repo/home_repo.dart';

class GoodBookCubit extends Cubit<GoodBookState> {
  GoodBookCubit(this.homeRepo) : super(InitialGoodBookState());
  static GoodBookCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;

  Future<void> getGoodBook() async {
    final result = await homeRepo.getGoodBook();
    result.fold(
      (failure) {
        emit(ErrorGoodBookState(error: failure.errMessage));
      },
      (books) {
        emit(SuccessGoodBookState(bookModel2: books));
      },
    );
  }
}
