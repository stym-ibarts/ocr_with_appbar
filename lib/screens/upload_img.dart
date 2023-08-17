// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:ocr/widgets/color.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';

import '../widgets/appbar.dart';
import '../widgets/button.dart';

class UploadImg extends StatefulWidget {
  const UploadImg({super.key});

  @override
  State<UploadImg> createState() => _UploadImgState();
}

class _UploadImgState extends State<UploadImg> {
  XFile? image;
  String? text;
  bool isLoading = false;
  // ignore: prefer_typing_uninitialized_variables
  var displayName;

  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      displayName = FirebaseAuth.instance.currentUser!.displayName;
      print(displayName);
    } else {
      print('signed out');
      print(displayName);
    }

    return Scaffold(
      appBar: const OCRAppBar(
        bgcolor: Color(0xFFF90404),
        title: '',
        iconAssetPath: 'assets/icon/back.png',
      ).preferredSize(),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/red_background_img.png'),
                  fit: BoxFit.cover)),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                image != null
                    ? Image.file(File(image!.path),
                        height: 300, width: 228, fit: BoxFit.cover)
                    : Container(
                        height: 300,
                        width: 228,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/invoice.png')),
                            border: Border.all(
                                color: AppColors.backgroundPink, width: 4.0),
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                const SizedBox(height: 25),
                text != null
                    ? SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          child: Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.all(16.0),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Json Response",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        // Add the IconButton for sharing
                                        onPressed: () {
                                          if (text != null) {
                                            Share.share(text!,
                                                subject: 'JSON Response');
                                          }
                                        },
                                        icon: const Icon(Icons.email_outlined),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    text!,
                                    style: const TextStyle(
                                      fontFamily:
                                          'Courier', // For monospaced font
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                // const Align(
                //     alignment: Alignment.center,
                //     child: Padding(
                //         padding: EdgeInsets.all(30),
                //         child: Text('Bill response will display here',
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20.0,
                //                 color: Colors.white)))),
                isLoading
                    ? const SizedBox(
                        height: 30,
                        child: Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator()))
                    : GestureDetector(
                        onTap: () async {
                          await checkAndRequestCameraPermission();
                          pickImage();
                        },
                        child: Container(
                            height: 78,
                            width: 78,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icon/pinkcamera.png'))))),
                const SizedBox(
                  height: 43,
                ),
                Card(
                  elevation: 5,
                  child: CustomButton(
                      backgroundColor: AppColors.backgroundPink,
                      textColor: AppColors.whiteText,
                      buttonText: 'Submit',
                      onPressed: () {
                        uploadImage();
                      }),
                ),
                const SizedBox(
                  height: 14,
                ),
                Card(
                  elevation: 5,
                  child: CustomButton(
                      backgroundColor: AppColors.backgroundWhite,
                      textColor: AppColors.textRed,
                      buttonText: 'Cancel',
                      fontWeight: FontWeight.bold,
                      onPressed: () {
                        Get.back();
                      }),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future pickImage() async {
    PermissionStatus cameraStatus = await Permission.camera.status;
    try {
      if (cameraStatus.isGranted) {
        final image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return;
        setState(() {
          this.image = image;
        });
        // ignore: unnecessary_this
        this.text = text;
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> checkAndRequestCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
  }

  Future<void> uploadImage() async {
    setState(() {
      isLoading = true;
    });

    if (image == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    const apiUrl = 'https://ocr2.asprise.com/api/v1/receipt';
    const apiKey = 'TEST';
    const recognizer = 'auto';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.fields['api_key'] = apiKey;
      request.fields['recognizer'] = recognizer;
      request.files.add(http.MultipartFile.fromBytes(
          'file', File(image!.path).readAsBytesSync(),
          filename: image!.name));
      var response = await request.send();
      var responseString = await response.stream.bytesToString();

      Map<String, dynamic> jsonData = json.decode(responseString);

      // String merchantName = jsonData["receipts"][0]["merchant_name"];

      // jsonData["success"] == false
      //     ? customSnackBar(text: jsonData["message"])
      //     : !displayName.isUndefinedOrNull
      //         ? customSnackBar(text: "Transaction Histtory Updated....")
      //         : null;
      text = responseString.toString();

      if (displayName != null && jsonData["success"] == true) {
        final myUuid = const Uuid().v4();
        final user = "$displayName/$myUuid";
        DatabaseReference ref = FirebaseDatabase.instance.ref(user);
        ref.set({"name": responseString});
      }

      setState(() {
        isLoading = false;
        jsonData["success"] == true
            ? text = responseString.toString()
            : text = null;
      });
    } catch (e) {
      var jsonResponse = json.decode(e.toString());
      setState(() {
        isLoading = false;
        text = jsonResponse.toString();
      });
    }
  }
}
