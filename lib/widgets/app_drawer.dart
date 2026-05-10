import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AppDrawer extends StatelessWidget {
  final UserModel currentUser;
  final int currentIndex;
  final ValueChanged<int> onPageSelected;
  final VoidCallback onLogout;

  const AppDrawer({
    super.key,
    required this.currentUser,
    required this.currentIndex,
    required this.onPageSelected,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(currentUser.fullName),
            accountEmail: Text(currentUser.email),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.handyman,
                color: Colors.orange,
                size: 36,
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
          ),
          ListTile(
            selected: currentIndex == 0,
            leading: const Icon(Icons.search),
            title: const Text("Search Services"),
            onTap: () {
              Navigator.pop(context);
              onPageSelected(0);
            },
          ),
          ListTile(
            selected: currentIndex == 1,
            leading: const Icon(Icons.person_add),
            title: const Text("Register Worker"),
            onTap: () {
              Navigator.pop(context);
              onPageSelected(1);
            },
          ),
          ListTile(
            selected: currentIndex == 2,
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              Navigator.pop(context);
              onPageSelected(2);
            },
          ),
          ListTile(
            selected: currentIndex == 3,
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              onPageSelected(3);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context);
              onLogout();
            },
          ),
        ],
      ),
    );
  }
}