// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:dio/dio.dart';
//import 'package:image_picker/image_picker.dart';

//!================ luncherUrl ===================//
//
//?  onpressed
//
Future<void> launcherCustomUrl(BuildContext context, String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Can\'t launch $url'),
      ),
    );
  }
}


//!============ uploadProfilePic ==========//
//
//?  to recall required xfile 
// Future uploadImageToAPI(XFile image) async {
//   return MultipartFile.fromFile(image.path,
//       filename: image.path.split('/').last);
// }
