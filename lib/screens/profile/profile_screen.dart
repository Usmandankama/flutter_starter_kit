import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_starter_kit/controllers/user_controller.dart';
import 'package:flutter_starter_kit/controllers/auth_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authController.signOut();
            },
          )
        ],
      ),
      body: Obx(() {
        final userName = userController.userName;
        final userEmail = userController.userEmail;
        final userPhoto = userController.userPhoto;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    userPhoto.isNotEmpty ? NetworkImage(userPhoto) : null,
                child: userPhoto.isEmpty
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
              const SizedBox(height: 16),
              Text(
                userName,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(userEmail),
              const Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  authController.signOut();
                },
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
