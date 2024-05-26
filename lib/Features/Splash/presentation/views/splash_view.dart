import 'package:flutter/material.dart';
import 'package:library_app/Features/Splash/presentation/views/Widgets/splash_View_Body.dart';

// ignore: camel_case_types
class splash_View extends StatelessWidget {
  const splash_View({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: splash_View_Body(),
    );
  }
}
