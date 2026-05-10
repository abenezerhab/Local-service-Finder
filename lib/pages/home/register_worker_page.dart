import 'package:flutter/material.dart';
import '../../models/provider_model.dart';

class RegisterWorkerPage extends StatefulWidget {
  final List<String> services;
  final Function(ProviderModel provider) onAddProvider;

  const RegisterWorkerPage({
    super.key,
    required this.services,
    required this.onAddProvider,
  });

  @override
  State<RegisterWorkerPage> createState() => _RegisterWorkerPageState();
}

class _RegisterWorkerPageState extends State<RegisterWorkerPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String workerService = "Plumber";

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    phoneController.dispose();
    experienceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void clearForm() {
    nameController.clear();
    locationController.clear();
    phoneController.clear();
    experienceController.clear();
    descriptionController.clear();

    setState(() {
      workerService = "Plumber";
    });
  }

  void submitWorker() {
    if (formKey.currentState!.validate()) {
      ProviderModel provider = ProviderModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text.trim(),
        service: workerService,
        location: locationController.text.trim(),
        phone: phoneController.text.trim(),
        rating: 0.0,
        experience: "${experienceController.text.trim()} years",
        description: descriptionController.text.trim(),
        isVerified: false,
      );

      widget.onAddProvider(provider);
      clearForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> serviceItems = widget.services
        .where((service) => service != "All")
        .map(
          (service) => DropdownMenuItem(
            value: service,
            child: Text(service),
          ),
        )
        .toList();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.person_add_alt_1,
                    size: 75,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Worker Registration",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Register as a service provider",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 22),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Worker or Business Name",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter worker name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  DropdownButtonFormField<String>(
                    value: workerService,
                    decoration: const InputDecoration(
                      labelText: "Service Category",
                      prefixIcon: Icon(Icons.work),
                      border: OutlineInputBorder(),
                    ),
                    items: serviceItems,
                    onChanged: (value) {
                      setState(() {
                        workerService = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      labelText: "Service Area",
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter service area";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter phone number";
                      }
                      if (value.length < 9) {
                        return "Enter a valid phone number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: experienceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Experience",
                      hintText: "Example: 3",
                      prefixIcon: Icon(Icons.timeline),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter experience";
                      }
                      int? years = int.tryParse(value);
                      if (years == null || years < 0) {
                        return "Enter valid years";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: "Service Description",
                      prefixIcon: Icon(Icons.description),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter description";
                      }
                      if (value.length < 10) {
                        return "Description is too short";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 22),
                  ElevatedButton.icon(
                    onPressed: submitWorker,
                    icon: const Icon(Icons.save),
                    label: const Text("Submit Registration"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}