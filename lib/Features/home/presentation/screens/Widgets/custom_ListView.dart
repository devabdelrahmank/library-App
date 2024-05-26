// ignore_for_file: camel_case_types, unnecessary_type_check, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Features/home/presentation/manger/BestSellerBooks_cubit/bestSellerBooks_Cubit.dart';
import 'package:library_app/Features/home/presentation/manger/BestSellerBooks_cubit/bestSellerBooks_States.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/custom_ListView_Item.dart';
import 'package:library_app/Features/home/presentation/screens/book_detils_view.dart';

import '../../../../../Core/utils/function/launch_url.dart';

class custom_ListView extends StatelessWidget {
  const custom_ListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestBookCubit, BestBookState>(
      builder: (context, state) {
        return state is SuccessBestBookState
            ? SizedBox(
                height: MediaQuery.of(context).size.height * .3,
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
                              nameBook: state
                                  .bookModel.items[index].volumeInfo!.title!,

                              authrName: state.bookModel.items[index]
                                          .volumeInfo!.authors.length ==
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
                              //
                              download: state.bookModel.items[index].saleInfo!
                                          .retailPrice !=
                                      null
                                  ? state.bookModel.items[index].saleInfo!
                                      .retailPrice!.amount!
                                      .toString()
                                  : '234',
                            ),
                          ),
                        );
                      },
                      child: custom_ListView_Item(
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
                    itemCount: state.bookModel.items.length,
                  ),
                ),
              )
            : state is ErrorBestBookState
                ? Center(
                    child: Text(state.error),
                  )
                : const Padding(
                    padding: EdgeInsets.all(100),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
      },
    );
  }
}
