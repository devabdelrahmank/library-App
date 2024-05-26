// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Features/Search/presentation/manger/cubit/search_cubit.dart';
import 'package:library_app/Features/Search/presentation/manger/cubit/search_state.dart';

class customSearchTextField extends StatelessWidget {
  final TextEditingController searchController;
  const customSearchTextField({
    super.key,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 20),
          child: TextField(
            controller: searchController,
            onChanged: (val) {
              SearchCubit.get(context).featchResultdata('anime-$val');
            },
            onSubmitted: (value) {},
            decoration: InputDecoration(
              suffixIcon: const Icon(CupertinoIcons.search),
              hintText: 'Search',
              enabledBorder: outlineInputBorder1(),
              focusedBorder: outlineInputBorder2(),
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder outlineInputBorder1() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: const BorderSide(
        color: Color.fromARGB(171, 255, 255, 255),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder2() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: const BorderSide(
        color: Color.fromARGB(171, 255, 255, 255),
      ),
    );
  }
}
