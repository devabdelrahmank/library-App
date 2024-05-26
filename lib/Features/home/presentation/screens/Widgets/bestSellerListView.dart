// ignore_for_file: camel_case_types, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Features/home/presentation/manger/goodbook_cubit/goodbook_cubit.dart';
import 'package:library_app/Features/home/presentation/manger/goodbook_cubit/goodbook_state.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/bestSellerListViewItem.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/book_detils_view_body.dart';

import '../../../../../Core/utils/function/launch_url.dart';

class bestSellerListView extends StatelessWidget {
  const bestSellerListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoodBookCubit, GoodBookState>(
      builder: (context, state) {
        return state is SuccessGoodBookState
            ? ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => book_detils_view_body(
                          onPressedDownload: () {
                            launcherCustomUrl(
                                context,
                                state.bookModel2.items[index].volumeInfo!
                                    .canonicalVolumeLink!);
                          },
                          onPressed: () {
                            launcherCustomUrl(
                                context,
                                state.bookModel2.items[index].volumeInfo!
                                    .previewLink!);
                          },
                          image: state.bookModel2.items[index].volumeInfo!
                                      .imageLinks ==
                                  null
                              ? 'https://st2.depositphotos.com/2619903/6028/v/950/depositphotos_60287149-stock-illustration-no-image-signs-for-web.jpg'
                              : state.bookModel2.items[index].volumeInfo!
                                  .imageLinks!.thumbnail!,
                          nameBook: state
                              .bookModel2.items[index].volumeInfo!.title
                              .toString(),
                          authrName: state.bookModel2.items[index].volumeInfo!
                                      .authors.length ==
                                  null
                              ? 'Max Ap-1'
                              : state.bookModel2.items[index].volumeInfo!
                                      .authors.firstOrNull ??
                                  'Max Ap-1',
                          rating: state.bookModel2.items[index].volumeInfo!
                                      .ratingsCount
                                      .toString() ==
                                  'null'
                              ? '2.7'
                              : state.bookModel2.items[index].volumeInfo!
                                  .ratingsCount
                                  .toString(),
                          download: state.bookModel2.items[index].saleInfo!
                                      .listPrice ==
                                  null
                              ? state.bookModel2.items[index].volumeInfo!
                                          .pageCount
                                          .toString() ==
                                      'null'
                                  ? '560'
                                  : state.bookModel2.items[index].volumeInfo!
                                      .pageCount
                                      .toString()
                              : state.bookModel2.items[index].saleInfo!
                                  .retailPrice!.amount
                                  .toString(),
                        ),
                      ),
                    );
                  },
                  child: bestSellerListViewItem(
                    image: state.bookModel2.items[index].volumeInfo!
                                .imageLinks ==
                            null
                        ? 'https://st2.depositphotos.com/2619903/6028/v/950/depositphotos_60287149-stock-illustration-no-image-signs-for-web.jpg'
                        : state.bookModel2.items[index].volumeInfo!.imageLinks!
                            .thumbnail!,
                    download: state
                                .bookModel2.items[index].saleInfo!.listPrice ==
                            null
                        ? state.bookModel2.items[index].volumeInfo!.pageCount
                                    .toString() ==
                                'null'
                            ? '560'
                            : state
                                .bookModel2.items[index].volumeInfo!.pageCount
                                .toString()
                        : state.bookModel2.items[index].saleInfo!.retailPrice!
                            .amount
                            .toString(),
                    authr: state.bookModel2.items[index].volumeInfo!.authors
                                .length ==
                            null
                        ? 'Max Ap-1'
                        : state.bookModel2.items[index].volumeInfo!.authors
                                .firstOrNull ??
                            'Max Ap-1',
                    rating: state.bookModel2.items[index].volumeInfo!
                                .ratingsCount
                                .toString() ==
                            'null'
                        ? '2.7'
                        : state.bookModel2.items[index].volumeInfo!.ratingsCount
                            .toString(),
                    title: state.bookModel2.items[index].volumeInfo!.title
                        .toString(),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 0,
                ),
                itemCount: state.bookModel2.items.length,
              )
            : state is ErrorGoodBookState
                ? Center(
                    child: Text(state.error),
                  )
                : const Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
      },
    );
  }
}
