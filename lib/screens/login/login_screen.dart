import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/controllers/auth_controller.dart';
import 'package:flutter_starter_kit/core/app_colors.dart';
import 'package:flutter_starter_kit/screens/home/home_shell.dart';
import 'package:flutter_starter_kit/screens/register/register_screen.dart';
import 'package:flutter_starter_kit/widgets/custom_button.dart';
import 'package:flutter_starter_kit/widgets/custom_textfield.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.find<AuthController>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  RxBool isLoading = false.obs; // Show loading indicator

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and password cannot be empty",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    try {
      await authController.loginUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offAll(() => const HomeShell()); // Navigate to home on success
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 140),
                Text(
                  'Sign in or \ncreate an account',
                  style: TextStyle(
                    color: AppColors.fontDark,
                    fontFamily: 'Montserrat',
                    fontSize: 36.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50.h),
                CustomTextfield(
                  label: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                ),
                SizedBox(height: 23.h),
                CustomTextfield(
                  label: 'Password',
                  icon: Icons.lock,
                  controller: passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const logi(),
                      //   ),
                      // );
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16.sp,
                        color: AppColors.accentColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                Obx(
                  () =>
                      isLoading.value
                          ? CircularProgressIndicator(
                            color: AppColors.secondaryColor,
                          )
                          : ActionButton(title: 'Sign in', onPressed: login),
                ),

                SizedBox(height: 30.h),
                Text(
                  'or login with',
                  style: TextStyle(
                    color: AppColors.fontDark,
                    fontSize: 17.sp,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  height: 50.h,
                  width: 300.w,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    onPressed: () async {
                      final result = await authController.signInWithGoogle();
                      if (result != null) {
                        // Navigate to home page on success
                        Get.offAllNamed(
                          '/home',
                        ); // or whatever your home route is
                      } else {
                        // Optional: Show an error message
                        Get.snackbar(
                          "Login Failed",
                          "Google sign-in was unsuccessful",
                        );
                      }
                    }, // Google login function (if needed)
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/google.png', height: 21.h),
                        SizedBox(width: 10.w),
                        Text(
                          'Login with Google',
                          style: TextStyle(
                            color: AppColors.darkBackground,
                            fontSize: 16.sp,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16.sp,
                        color: AppColors.fontDark,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.sp,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
