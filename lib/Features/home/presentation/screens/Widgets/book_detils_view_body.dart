// ignore_for_file: camel_case_types,

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app/Core/utils/fonts.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/customDetails_BookImage.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/custom_book_image.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/detailsListView.dart';

class book_detils_view_body extends StatelessWidget {
  final String image;
  final String nameBook;
  final String authrName;
  final String rating;
  final String download;
  final Function() onPressed;
  final Function() onPressedDownload;

  const book_detils_view_body({
    super.key,
    required this.image,
    required this.nameBook,
    required this.authrName,
    required this.rating,
    required this.download,
    required this.onPressed,
    required this.onPressedDownload,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 35,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: onPressedDownload,
                icon: const Icon(
                  CupertinoIcons.cart,
                  size: 35,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              custom_book_image(image: image),
              const SizedBox(height: 30),
              customDetails_BookImage(
                nameBook: nameBook,
                authrName: authrName,
                rating: rating,
                download: download,
                onpressed: onPressed,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle30.copyWith(fontSize: 22),
                  ),
                ),
              ),
              const detailsListView(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
