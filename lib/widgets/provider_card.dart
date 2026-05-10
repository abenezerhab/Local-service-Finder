import 'package:flutter/material.dart';
import '../models/provider_model.dart';

class ProviderCard extends StatelessWidget {
  final ProviderModel provider;

  const ProviderCard({
    super.key,
    required this.provider,
  });

  IconData getServiceIcon(String service) {
    if (service == "Plumber") {
      return Icons.plumbing;
    } else if (service == "Electrician") {
      return Icons.electrical_services;
    } else if (service == "Tutor") {
      return Icons.school;
    } else if (service == "Cleaner") {
      return Icons.cleaning_services;
    } else if (service == "Barber") {
      return Icons.content_cut;
    } else if (service == "Mechanic") {
      return Icons.car_repair;
    } else {
      return Icons.work;
    }
  }

  String getRatingText() {
    if (provider.rating == 0.0) {
      return "New";
    }

    return "${provider.rating} ⭐";
  }

  void showContactMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Contact Provider"),
          content: Text(
            "Provider: ${provider.name}\nPhone: ${provider.phone}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void showProviderDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.orange.shade100,
                    child: Icon(
                      getServiceIcon(provider.service),
                      color: Colors.orange,
                      size: 42,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: Text(
                    provider.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Text(
                    provider.service,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Center(
                  child: Chip(
                    avatar: Icon(
                      provider.isVerified
                          ? Icons.verified
                          : Icons.hourglass_bottom,
                      size: 18,
                    ),
                    label: Text(
                      provider.isVerified ? "Verified Provider" : "New Provider",
                    ),
                  ),
                ),
                const Divider(height: 30),
                ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.orange),
                  title: const Text("Location"),
                  subtitle: Text(provider.location),
                ),
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.green),
                  title: const Text("Phone"),
                  subtitle: Text(provider.phone),
                ),
                ListTile(
                  leading: const Icon(Icons.star, color: Colors.orange),
                  title: const Text("Rating"),
                  subtitle: Text(getRatingText()),
                ),
                ListTile(
                  leading: const Icon(Icons.timeline, color: Colors.orange),
                  title: const Text("Experience"),
                  subtitle: Text(provider.experience),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(provider.description),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showContactMessage(context);
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text("Contact Provider"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(14),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.orange.shade100,
          child: Icon(
            getServiceIcon(provider.service),
            color: Colors.orange,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                provider.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (provider.isVerified)
              const Icon(
                Icons.verified,
                color: Colors.blue,
                size: 18,
              ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(provider.service),
              Text(provider.location),
              Text("${provider.experience} • ${getRatingText()}"),
            ],
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.phone,
            color: Colors.green,
          ),
          onPressed: () {
            showContactMessage(context);
          },
        ),
        onTap: () {
          showProviderDetails(context);
        },
      ),
    );
  }
}