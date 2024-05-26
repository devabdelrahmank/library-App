// ignore_for_file: camel_case_types, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Features/Search/presentation/manger/cubit/search_cubit.dart';
import 'package:library_app/Features/Search/presentation/manger/cubit/search_state.dart';
import 'package:library_app/Features/Search/presentation/views/widgets/customSearchItem.dart';
import 'package:library_app/Features/home/presentation/screens/book_detils_view.dart';

import '../../../../../Core/utils/function/launch_url.dart';

class customSearchResult extends StatelessWidget {
  const customSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is SuccessSearchState
            ? Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => bookDetilsView(
                            onPressedDownload: () {
                              launcherCustomUrl(
                                  context,
                                  state.bookModel.items[index].volumeInfo!
                                      .canonicalVolumeLink!);
                            },
                            onPressed: () {
                              launcherCustomUrl(
                                  context,
                                  state.bookModel.items[index].volumeInfo!
                                      .previewLink!);
                            },
                            image: state.bookModel.items[index].volumeInfo!
                                        .imageLinks ==
                                    null
                                ? 'https://st2.depositphotos.com/2619903/6028/v/950/depositphotos_60287149-stock-illustration-no-image-signs-for-web.jpg'
                                : state.bookModel.items[index].volumeInfo!
                                    .imageLinks!.thumbnail
                                    .toString(),
                            nameBook:
                                state.bookModel.items[index].volumeInfo!.title!,
                            authrName: state.bookModel.items[index].volumeInfo!
                                        .authors.length ==
                                    null
                                ? 'Max Ap-1'
                                : state.bookModel.items[index].volumeInfo!
                                        .authors.firstOrNull ??
                                    'Max Ap-1',
                            rating: state.bookModel.items[index].volumeInfo!
                                        .averageRating
                                        .toString() ==
                                    'null'
                                ? 2.6.toString()
                                : state.bookModel.items[index].volumeInfo!
                                    .averageRating
                                    .toString(),
                            download: state.bookModel.items[index].saleInfo!
                                        .listPrice ==
                                    null
                                ? state.bookModel.items[index].volumeInfo!
                                            .pageCount
                                            .toString() ==
                                        'null'
                                    ? '560'
                                    : state.bookModel.items[index].volumeInfo!
                                        .pageCount
                                        .toString()
                                : state.bookModel.items[index].saleInfo!
                                    .retailPrice!.amount
                                    .toString(),
                          ),
                        ),
                      );
                    },
                    child: customSearchItem(
                      image: state.bookModel.items[index].volumeInfo!
                                  .imageLinks ==
                              null
                          ? 'https://st2.depositphotos.com/2619903/6028/v/950/depositphotos_60287149-stock-illustration-no-image-signs-for-web.jpg'
                          : state.bookModel.items[index].volumeInfo!.imageLinks!
                              .thumbnail
                              .toString(),
                      title: state.bookModel.items[index].volumeInfo!.title!,
                      authrName: state.bookModel.items[index].volumeInfo!
                                  .authors.length ==
                              null
                          ? 'Max Ap-1'
                          : state.bookModel.items[index].volumeInfo!.authors
                                  .firstOrNull ??
                              'Max Ap-1',
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 0,
                  ),
                  itemCount: state.bookModel.items.length,
                ),
              )
            : state is ErrorSearchState
                ? Text(
                    state.error,
                  )
                : const Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
      },
    );
  }
}
