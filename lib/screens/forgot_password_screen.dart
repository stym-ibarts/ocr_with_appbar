import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr/screens/scanner.dart';
import 'package:ocr/widgets/button.dart';
import 'package:ocr/widgets/color.dart';
import 'package:ocr/widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/red_background_img.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Forgot\nPassword",
              style: TextStyle(fontSize: 28, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            CustomTextField(
              labelText: 'Email',
              validator: (value) {
                email = value.toString();
                final emailRegExp =
                    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                if (value == null || value.isEmpty) {
                  return 'email is required';
                } else if (!emailRegExp.hasMatch(value)) {
                  return "Invalid email address";
                }
                return null;
              },
            ),
            // const TextField(
            //   decoration: InputDecoration(
            //       labelText: 'Email',
            //       filled: true,
            //       fillColor: Colors.white,
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(10)))),
            // ),
            const SizedBox(height: 30),
            CustomButton(
              backgroundColor: AppColors.backgroundPink,
              textColor: AppColors.backgroundWhite,
              buttonText: "Submit",
              onPressed: () => {
                email.isNotEmpty ? reset() : customSnackBar(text: "Please enter email.")
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              backgroundColor: AppColors.backgroundWhite,
              textColor: AppColors.textRed,
              buttonText: "Cancel",
              onPressed: () =>
                  {Get.to(() => const Scanner(), transition: Transition.fade)},
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushReplacement(context,
            //           MaterialPageRoute(builder: (BuildContext context) {
            //         return const Scanner();
            //       }));
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.white,
            //       fixedSize: const Size(170, 55),
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //     ),
            //     child: const Text("Cancel",
            //         style:
            //             TextStyle(fontSize: 18.0, color: Color(0xFFE93333)))
            //             )
          ],
        ),
      ),
    );
  }
  
Future<void> reset() async {
    final auth = FirebaseAuth.instance;
    auth.sendPasswordResetEmail(email: email).then((value) => Get.toNamed('/signInScreen'));
}
}