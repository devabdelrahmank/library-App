// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app/Core/utils/fonts.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/bestSellerListView.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/custom_AppBar.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/custom_ListView.dart';

class homeScreenBody extends StatelessWidget {
  const homeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const custom_AppBar(),
              //! تمت
              const custom_ListView(),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 25),
                child: Text('Best Seller', style: Styles.textStyle30),
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: bestSellerListView(),
        ),
      ],
    );
  }
}
