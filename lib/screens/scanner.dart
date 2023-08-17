import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ocr/widgets/button.dart';
import 'package:ocr/widgets/color.dart';

import 'signin_screen.dart';
import 'signup_screen.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    logout();
    // if (FirebaseAuth.instance.currentUser != null) {
    //   print('signed in');
    //   final displayName = FirebaseAuth.instance.currentUser!.displayName;
    //   print(displayName);
    // } else {
    //   print('signed out');
    // }


    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/red_background_img.png'),
                      fit: BoxFit.fill))),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 150.0),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.symmetric(horizontal: 100),
                    // color: Colors.blueGrey,
                    child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/uploadimg');
                        },
                        child: const Image(
                            image: AssetImage('assets/icon/pinkcamera.png'))),
                  ),
                  const SizedBox(height: 50.0),
                  CustomButton(
                      backgroundColor: AppColors.backgroundPink,
                      textColor: AppColors.backgroundWhite,
                      buttonText: "Sign In",
                      onPressed: () {
                        Get.to(() => const SignInScreen(),
                            transition: Transition.fade);
                      }),
                  const SizedBox(height: 20.0),
                  CustomButton(
                      backgroundColor: AppColors.backgroundWhite,
                      textColor: AppColors.textRed,
                      buttonText: "Sign Up",
                      onPressed: () {
                        Get.to(() => const SignupScreen(),
                            transition: Transition.fade);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
