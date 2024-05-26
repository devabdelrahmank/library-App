// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/Core/utils/fonts.dart';

class bestSellerListViewItem extends StatelessWidget {
  final String image;
  final String rating;
  final String authr;
  final String download;
  final String title;
  const bestSellerListViewItem({
    super.key,
    required this.image,
    required this.rating,
    required this.authr,
    required this.download,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          SizedBox(
            height: 140,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: AspectRatio(
                aspectRatio: 2.3 / 4,
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    authr,
                    style: Styles.textStyle14.copyWith(),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Free",
                      style: Styles.textStyle20,
                      maxLines: 2,
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      '($download)',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
