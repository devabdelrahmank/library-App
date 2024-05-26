// ignore_for_file: camel_case_types, must_be_immutable

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/Features/Search/presentation/views/widgets/customSearchResult.dart';
import 'package:library_app/Features/Search/presentation/views/widgets/customSearchTextField.dart';

import '../../../../../Core/database/apis/dio_consumer.dart';
import '../../../data/repo/search_repo_impl.dart';
import '../../manger/cubit/search_cubit.dart';

class search_View_body extends StatelessWidget {
  final searchController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  search_View_body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        SearchRepoImpl(
          api: DioConsumer(
            dio: Dio(),
          ),
        ),
      )..featchResultdata("anime-different"),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            customSearchTextField(
              searchController: searchController,
            ),
            const customSearchResult(),
          ],
        ),
      ),
    );
  }
}
