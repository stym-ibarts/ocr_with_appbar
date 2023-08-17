import 'package:get/get.dart';
import 'package:ocr/screens/dashboard.dart';
import 'package:ocr/screens/database.dart';
import 'package:ocr/screens/forgot_password_screen.dart';
import 'package:ocr/screens/profile.dart';
import 'package:ocr/screens/reward.dart';
import 'package:ocr/screens/scanner.dart';
import 'package:ocr/screens/settings.dart';
import 'package:ocr/screens/signin_screen.dart';
import 'package:ocr/screens/signup_screen.dart';
import 'package:ocr/screens/splash_screen.dart';
import 'package:ocr/screens/transaction_details.dart';
import 'package:ocr/screens/transaction_history.dart';
import 'package:ocr/screens/upload_img.dart';

class RouteClass {
  static List<GetPage> routes = [
    GetPage(name: '/', page: () => const Scanner()),
    GetPage(name: '/signInScreen', page: () => const SignInScreen()),
    GetPage(name: '/signUpScreen', page: () => const SignupScreen()),
    GetPage(name: '/dashboard', page: () => const Dashboard()),
    GetPage(
        name: '/forgotPasswordScreen',
        page: () => const ForgotPasswordScreen()),
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/profile', page: () => const Profile()),
    GetPage(
        name: '/transactionhistory', page: () => const TransactionHistory()),
    GetPage(
        name: '/transactiondetails', page: () => const TransactionDetails()),
    GetPage(name: '/reward', page: () => const Reward()),
    GetPage(name: '/settings', page: () => const Settings()),
    GetPage(name: '/uploadimg', page: () => const UploadImg()),
    GetPage(name: '/database', page: () => const Database()),
  ];
}

// Platform  Firebase App Id
// android   1:1074938912751:android:b8c030fac13d4dffdda01a
