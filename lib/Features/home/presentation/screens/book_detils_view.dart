// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/book_detils_view_body.dart';

class bookDetilsView extends StatelessWidget {
  final String image;
  final String nameBook;
  final String authrName;
  final String rating;
  final String download;
  final Function() onPressed;
  final Function() onPressedDownload;
  const bookDetilsView({
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
    return book_detils_view_body(
      onPressedDownload: onPressedDownload,
      onPressed: onPressed,
      image: image,
      nameBook: nameBook,
      authrName: authrName,
      rating: rating,
      download: download,
    );
  }
}
