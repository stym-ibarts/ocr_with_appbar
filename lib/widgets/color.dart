import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors {
  static const Color backgroundPink = Color(0xFFFF7E7E); // FF7E7E
  static const Color backgroundWhite = Colors.white;
  static const Color backgroundBlack = Colors.black;
  static const Color textRed = Color(0xFFE93333);
  static const Color greyText = Color(0xFF676767);
  static const Color whiteText = Colors.white;
  static const Color blackText = Colors.black;
}


   void customSnackBar({required String text}) {
    Get.rawSnackbar(
      messageText: Text(text,style: const TextStyle(color: Colors.white),),
      margin: const EdgeInsets.all(10),
      borderRadius: 5,
      snackPosition: SnackPosition.BOTTOM,
      barBlur: 7.0,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      duration: const Duration(seconds: 5)
    );
  }
