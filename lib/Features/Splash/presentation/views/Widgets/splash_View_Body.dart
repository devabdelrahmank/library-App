// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:library_app/Features/Splash/presentation/views/Widgets/slideng_logo.dart';
import 'package:library_app/Features/home/presentation/screens/home_screen.dart';

class splash_View_Body extends StatefulWidget {
  const splash_View_Body({super.key});

  @override
  State<splash_View_Body> createState() => _splash_View_BodyState();
}

class _splash_View_BodyState extends State<splash_View_Body>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimate;

  @override
  void initState() {
    super.initState();
    initAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return slideng_logo(
      animationcontroller: animationController,
      animation: slidingAnimate,
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    slidingAnimate = Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
        .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const homeScreen(),
          ),
        );
      },
    );
  }
}
