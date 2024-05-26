// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:library_app/Constant.dart';
import 'package:library_app/Core/utils/fonts.dart';

class customDetails_BookImage extends StatelessWidget {
  final String nameBook;
  final String authrName;
  final String download;
  final String rating;
  final Function()? onpressed;

  const customDetails_BookImage({
    super.key,
    required this.nameBook,
    required this.authrName,
    required this.download,
    required this.rating,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nameBook,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: Styles.textStyle30.copyWith(fontSize: 28),
        ),
        const SizedBox(height: 4),
        Text(
          authrName,
          style: Styles.textStyle14.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.yellow),
            const SizedBox(width: 7),
            Text(
              rating,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15),
            Text(
              '($download)',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 37),
        Padding(
          padding: const EdgeInsets.only(bottom: 49, left: 40, right: 40),
          child: Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                      color: Colors.white,
                    ),
                    child: Align(
                      child: Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: onpressed,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        color: scolor,
                      ),
                      child: Align(
                        child: Text(
                          'preview',
                          style: Styles.textStyle20.copyWith(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
