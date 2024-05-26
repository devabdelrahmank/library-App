// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:library_app/Core/utils/assets.dart';

class slideng_logo extends StatelessWidget {
  const slideng_logo({
    super.key,
    required this.animationcontroller,
    required this.animation,
  });
  final Listenable animationcontroller;
  final Animation<Offset> animation;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: animationcontroller,
          builder: (BuildContext context, Widget? _) {
            return SlideTransition(
              position: animation,
              child: SvgPicture.asset(AssetsData.logo),
            );
          },
        ),
      ],
    );
  }
}
