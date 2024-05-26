// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:library_app/Features/home/presentation/screens/Widgets/home_view_body.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: homeScreenBody(),
    );
  }
}
