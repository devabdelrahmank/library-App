import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Features/Search/data/repo/search_repo.dart';
import 'package:library_app/Features/Search/presentation/manger/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(InitialSearchState());
  static SearchCubit get(context) => BlocProvider.of(context);
  final SearchRepo searchRepo;

  Future<void> featchResultdata(url) async {
    var result = await searchRepo.featchResultdata(url);

    result.fold(
      (failure) {
        emit(ErrorSearchState(failure.errMessage));
      },
      (bobk) {
        emit(SuccessSearchState(bobk));
      },
    );
  }
}
