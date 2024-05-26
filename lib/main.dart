// ignore_for_file: camel_case_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:library_app/BlocOpserver/myBloc-opserver.dart';
import 'package:library_app/Constant.dart';
import 'package:library_app/Core/database/apis/dio_consumer.dart';
import 'package:library_app/Core/utils/service_locator.dart';
import 'package:library_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:library_app/Features/home/presentation/manger/BestSellerBooks_cubit/bestSellerBooks_Cubit.dart';
import 'package:library_app/Features/home/presentation/manger/goodbook_cubit/goodbook_cubit.dart';
import 'package:library_app/Features/home/data/repo/home_repo_imp.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  setUpServerLocator();
  runApp(const Library_App());
}

class Library_App extends StatelessWidget {
  const Library_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BestBookCubit(
            getIt.get<HomeRepoImp>(),
          )..getBestSellerBook(),
        ),
        BlocProvider(
          create: (context) =>
              GoodBookCubit(HomeRepoImp(api: DioConsumer(dio: Dio())))
                ..getGoodBook(),
        ),
      ],
      child: MaterialApp(
        title: 'Library App',
        home: const splash_View(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: pcolor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
