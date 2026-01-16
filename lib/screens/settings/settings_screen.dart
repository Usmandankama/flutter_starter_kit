import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Get.isDarkMode;
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDarkMode,
            onChanged: (value) {
              Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
            secondary: const Icon(Icons.brightness_6),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            subtitle: const Text("Coming soon..."),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Language"),
            subtitle: const Text("Coming soon..."),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () async {
              authController.signOut();
            },
          ),
        ],
      ),
    );
  }
}
