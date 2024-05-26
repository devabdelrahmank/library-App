// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class custom_book_image extends StatelessWidget {
  final String image;
  const custom_book_image({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .30,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
