import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/widgets/appbar.dart';
import 'package:ocr/widgets/color.dart';
import 'package:ocr/widgets/custom_textfield.dart';

import '../widgets/button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const OCRAppBar(
                title: "My Profile",
                bgcolor: AppColors.textRed,
                iconAssetPath: "assets/icon/back.png")
            .preferredSize(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(left: 22, right: 22),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/red_background_img.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        const ImageIcon(AssetImage("assets/icon/profile.png"))
                            .image,
                  ),
                ),
                const SizedBox(height: 32.0),
                const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            10), //apply padding horizontal or vertical only
                    child: Text(
                      "Name",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )),
                const CustomTextField(labelText: ''),
                const SizedBox(height: 32.0),
                const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            10), //apply padding horizontal or vertical only
                    child: Text(
                      "Email",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )),
                const CustomTextField(labelText: ''),
                const SizedBox(height: 50.0),
                CustomButton(
                    backgroundColor: AppColors.backgroundWhite,
                    textColor: AppColors.textRed,
                    buttonText: 'Log Out',
                    onPressed: () {
                      Get.to(() => const Profile(),
                          transition: Transition.fade);
                    }),
              ],
            ),
          ),
        ));
  }
}
