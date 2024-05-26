// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:library_app/Features/Search/presentation/views/widgets/search_View_body.dart';

class Search_View extends StatelessWidget {
  const Search_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: search_View_body(),
      ),
    );
  }
}
