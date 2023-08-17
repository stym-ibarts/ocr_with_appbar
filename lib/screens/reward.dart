import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/widgets/button.dart';
import 'package:ocr/widgets/color.dart';
import '../widgets/appbar.dart';

class Reward extends StatelessWidget {
  const Reward({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const OCRAppBar(
          bgcolor: Color(0xFFF90404),
          title: '',
          iconAssetPath: 'assets/icon/back.png',
          trailingIcon: 'assets/icon/settings.png',
        ).preferredSize(),
        body: Stack(children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/dashboard_background.png'),
                      fit: BoxFit.cover))),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 120),
                const SizedBox(
                  height: 269,
                  width: 226,
                  child: Card(
                    elevation: 10,
                    child: Image(
                      image: AssetImage('assets/images/reward.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 120),
                Card(
                  elevation: 5,
                  child: CustomButton(
                    backgroundColor: AppColors.backgroundPink,
                    textColor: AppColors.whiteText,
                    buttonText: "Get my reward",
                    onPressed: () {
                      return;
                    },
                  ),
                ),
                const SizedBox(height: 22),
                Card(
                  elevation: 5,
                  child: CustomButton(
                    backgroundColor: AppColors.backgroundWhite,
                    textColor: AppColors.textRed,
                    buttonText: "Cancel",
                    onPressed: () {
                      Get.toNamed('/');
                    },
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
