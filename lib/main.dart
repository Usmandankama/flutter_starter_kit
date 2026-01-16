import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/controllers/auth_controller.dart';
import 'package:flutter_starter_kit/controllers/user_controller.dart';
import 'package:flutter_starter_kit/screens/home/home_shell.dart';
import 'package:flutter_starter_kit/screens/login/login_screen.dart';
import 'package:flutter_starter_kit/screens/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Generated via `flutterfire configure`

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController()); // Initialize AuthController
  Get.put(UserController()); // Initialize AuthController
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // base size used in design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: '/home',
          getPages: [
            GetPage(name: '/login', page: () => const LoginScreen()),
            GetPage(name: '/home', page: () => const HomeShell()),
            // Add other pages here
          ],
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}