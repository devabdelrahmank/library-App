// ignore_for_file: camel_case_types

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Features/home/presentation/manger/BestSellerBooks_cubit/bestSellerBooks_States.dart';
import 'package:library_app/Features/home/data/repo/home_repo.dart';

class BestBookCubit extends Cubit<BestBookState> {
  BestBookCubit(this.homeRepo) : super(InitialBestBookState());
  static BestBookCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;

  Future<void> getBestSellerBook() async {
    emit(LoadingBestBookState());
    var result = await homeRepo.getBestSellerBook();

    result.fold(
      (failure) {
        emit(ErrorBestBookState(error: failure.errMessage));
      },
      (books) {
        emit(SuccessBestBookState(bookModel: books));
      },
    );
  }
}
