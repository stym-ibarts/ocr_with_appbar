import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/screens/signin_screen.dart';
import 'package:ocr/widgets/settings_container.dart';

import '../widgets/appbar.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OCRAppBar(
        title: '',
        bgcolor: Color(0xFFF90404),
        iconAssetPath: 'assets/icon/back.png',
      ).preferredSize(),
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/settings/settingsbackground.png'),
                      fit: BoxFit.cover))),
           SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Setttings",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1),
                  ),
                  const SizedBox(height: 30),
                  const SettingsContainer(
                    boxText: 'Account',
                    imgPath: 'assets/images/settings/profile.png',
                  ),
                  const SizedBox(height: 10),
                  const SettingsContainer(
                    boxText: 'Change Password',
                    imgPath: 'assets/images/settings/password.png',
                  ),
                  const SizedBox(height: 10),
                  const SettingsContainer(
                    boxText: 'Help',
                    imgPath: 'assets/images/settings/help.png',
                  ),
                  const SizedBox(height: 10),
                  const SettingsContainer(
                    boxText: 'Notification',
                    imgPath: 'assets/images/settings/bell.png',
                  ),
                  const SizedBox(height: 10),
                  const SettingsContainer(
                    boxText: 'About Me',
                    imgPath: 'assets/images/settings/profile.png',
                  ),
                  const SizedBox(height: 10),
                  SettingsContainer(
                    boxText: "Logout",
                    imgPath: 'assets/images/settings/logout.png',
                    onTap: logout,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );

  }
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const SignInScreen());
  }

}
