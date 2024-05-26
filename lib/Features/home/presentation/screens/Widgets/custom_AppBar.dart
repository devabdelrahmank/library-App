// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_app/Core/utils/assets.dart';
import 'package:library_app/Features/Search/presentation/views/search_view.dart';

class custom_AppBar extends StatelessWidget {
  const custom_AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 10,
        right: 20,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsData.logo,
            height: 100,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>const Search_View(),
                ),
              );
            },
            icon: const Icon(
              CupertinoIcons.search,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
