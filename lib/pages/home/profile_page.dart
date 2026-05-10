import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class ProfilePage extends StatelessWidget {
  final UserModel currentUser;
  final int providerCount;

  const ProfilePage({
    super.key,
    required this.currentUser,
    required this.providerCount,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.orange.shade100,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    currentUser.fullName,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(currentUser.role),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 3,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.orange),
                  title: const Text("Email"),
                  subtitle: Text(currentUser.email),
                ),
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.orange),
                  title: const Text("Phone"),
                  subtitle: Text(currentUser.phone),
                ),
                const Divider(height: 0),
                ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.orange),
                  title: const Text("Location"),
                  subtitle: Text(currentUser.location),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            color: Colors.orange.shade50,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  const Icon(
                    Icons.groups,
                    color: Colors.orange,
                    size: 38,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      "$providerCount service providers available",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}