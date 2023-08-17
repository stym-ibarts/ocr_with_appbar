import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ocr/widgets/color.dart';

import '../widgets/appbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const OCRAppBar(
          bgcolor: Color(0xFFF90404),
          title: '',
          iconAssetPath: '',
          trailingIcon: 'assets/icon/settings.png',
        ).preferredSize(),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage('assets/images/dashboard_background.png'),
                      fit: BoxFit.cover)),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onDoubleTap: () => Get.toNamed('/database'),
                    child: const Text(
                      'Dashboard',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/uploadimg');
                      },
                      child: const Card(
                        elevation: 10,
                        color: AppColors.backgroundPink,
                        child: Column(
                          children: [
                            SizedBox(height: 25.0),
                            Image(
                                image:
                                    AssetImage('assets/icon/pinkcamera.png')),
                            SizedBox(height: 15.0),
                            Text(
                              'Scanner',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.whiteText,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.6,
                              ),
                            ),
                            SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/transactionhistory');
                      },
                      child: const Card(
                        elevation: 10,
                        color: AppColors.backgroundWhite,
                        child: Column(
                          children: [
                            SizedBox(height: 25.0),
                            Image(
                                image: AssetImage(
                                    'assets/images/dashboard_img1.png')),
                            SizedBox(height: 15.0),
                            Text(
                              'Transaction History',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFFE93333),
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.6,
                              ),
                            ),
                            SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed('/reward');
                      },
                      child: const Card(
                        elevation: 10,
                        color: AppColors.backgroundPink,
                        child: Column(
                          children: [
                            SizedBox(height: 25.0),
                            Image(
                                image: AssetImage(
                                    'assets/images/dashboard_img2.png')),
                            SizedBox(height: 15.0),
                            Text(
                              'Reward',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.6,
                              ),
                            ),
                            SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
