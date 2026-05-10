import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class SettingsPage extends StatefulWidget {
  final UserModel currentUser;
  final VoidCallback onLogout;

  const SettingsPage({
    super.key,
    required this.currentUser,
    required this.onLogout,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool locationEnabled = true;

  void confirmLogout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.onLogout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Card(
            elevation: 3,
            child: Column(
              children: [
                SwitchListTile(
                  value: notificationsEnabled,
                  activeColor: Colors.orange,
                  title: const Text("Notifications"),
                  subtitle: const Text("Receive updates from the app"),
                  secondary: const Icon(Icons.notifications),
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
                const Divider(height: 0),
                SwitchListTile(
                  value: locationEnabled,
                  activeColor: Colors.orange,
                  title: const Text("Location Access"),
                  subtitle: const Text("Use your area to suggest services"),
                  secondary: const Icon(Icons.location_on),
                  onChanged: (value) {
                    setState(() {
                      locationEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 3,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info, color: Colors.orange),
                  title: const Text("About App"),
                  subtitle: const Text("Local Service Finder version 1.0"),
                  onTap: () {},
                ),
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Icons.security, color: Colors.orange),
                  title: const Text("Privacy"),
                  subtitle: const Text("Basic demo privacy settings"),
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 3,
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              subtitle: Text(widget.currentUser.email),
              onTap: confirmLogout,
            ),
          ),
        ],
      ),
    );
  }
}