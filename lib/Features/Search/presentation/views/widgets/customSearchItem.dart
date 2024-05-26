// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:library_app/Core/utils/fonts.dart';
import 'package:library_app/Features/Search/presentation/views/widgets/image_Search.dart';

class customSearchItem extends StatelessWidget {
  final String title;
  final String authrName;
  final String image;

  const customSearchItem({
    super.key,
    required this.title,
    required this.authrName,
    required this.image,
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
          imageSearch(image: image),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.textStyle20.copyWith(fontSize: 22),
                  maxLines: 2,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    authrName,
                    style: Styles.textStyle14.copyWith(),
                  ),
                ),
                Text(
                  "Free",
                  style: Styles.textStyle20,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
