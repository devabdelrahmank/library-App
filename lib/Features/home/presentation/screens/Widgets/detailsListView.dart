// ignore_for_file: camel_case_types, file_names, unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Core/database/apis/dio_consumer.dart';
import 'package:library_app/Core/utils/function/launch_url.dart';
import 'package:library_app/Features/home/presentation/manger/combleteBook_cubiti/combleteBook_cubit.dart';
import 'package:library_app/Features/home/presentation/manger/combleteBook_cubiti/combleteBook_satate.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/detailsListViewItem.dart';
import 'package:library_app/Features/home/presentation/screens/book_detils_view.dart';
import 'package:library_app/Features/home/data/repo/home_repo_imp.dart';

class detailsListView extends StatelessWidget {
  const detailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CombleteBookCubit(
        HomeRepoImp(
          api: DioConsumer(
            dio: Dio(),
          ),
        ),
      )..getCombleteBook(),
      child: BlocConsumer<CombleteBookCubit, CombleteBookState>(
        listener: (context, state) {
          if (state is SuccessCombleteBookState) {}
        },
        builder: (context, state) {
          return state is SuccessCombleteBookState
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * .18,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => bookDetilsView(
                                      onPressedDownload: () {
                                        launcherCustomUrl(
                                            context,
                                            state.bookModel.items[index]
                                                .accessInfo!.webReaderLink!);
                                      },
                                      onPressed: () {
                                        launcherCustomUrl(
                                            context,
                                            state.bookModel.items[index]
                                                .volumeInfo!.previewLink!);
                                      },
                                      image: state.bookModel.items[index]
                                                  .volumeInfo!.imageLinks ==
                                              null
                                          ? 'https://st2.depositphotos.com/2619903/6028/v/950/depositphotos_60287149-stock-illustration-no-image-signs-for-web.jpg'
                                          : state.bookModel.items[index]
                                              .volumeInfo!.imageLinks!.thumbnail
                                              .toString(),
                                      nameBook: state.bookModel.items[index]
                                          .volumeInfo!.title!,
                                      authrName: state.bookModel.items[index]
                                                  .volumeInfo!.authors.length ==
                                              null
                                          ? 'Max Ap-1'
                                          : state
                                                  .bookModel
                                                  .items[index]
                                                  .volumeInfo!
                                                  .authors
                                                  .firstOrNull ??
                                              'Max Ap-1',
                                      rating: state.bookModel.items[index]
                                                  .volumeInfo!.averageRating
                                                  .toString() ==
                                              'null'
                                          ? 2.6.toString()
                                          : state.bookModel.items[index]
                                              .volumeInfo!.averageRating
                                              .toString(),
                                      download: state.bookModel.items[index]
                                                  .saleInfo!.retailPrice !=
                                              null
                                          ? state.bookModel.items[index]
                                              .saleInfo!.retailPrice!.amount!
                                              .toString()
                                          : '234',
                                    ),
                                  ),
                                );
                              },
                              child: detailsListViewItem(
                                image: state.bookModel.items[index].volumeInfo!
                                            .imageLinks ==
                                        null
                                    ? 'https://st2.depositphotos.com/2619903/6028/v/950/depositphotos_60287149-stock-illustration-no-image-signs-for-web.jpg'
                                    : state.bookModel.items[index].volumeInfo!
                                        .imageLinks!.thumbnail
                                        .toString(),
                              ),
                            ),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 15,
                            ),
                        itemCount: state.bookModel.items.length),
                  ),
                )
              : state is ErrorCombleteBookState
                  ? Center(
                      child: Text(state.error),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(50),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
        },
      ),
    );
  }
}
