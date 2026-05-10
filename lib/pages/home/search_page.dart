import 'package:flutter/material.dart';
import '../../models/provider_model.dart';
import '../../widgets/provider_card.dart';

class SearchPage extends StatefulWidget {
  final List<ProviderModel> providers;
  final List<String> services;

  const SearchPage({
    super.key,
    required this.providers,
    required this.services,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedService = "All";
  String searchText = "";

  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<ProviderModel> get filteredProviders {
    return widget.providers.where((provider) {
      bool matchesService =
          selectedService == "All" || provider.service == selectedService;

      bool matchesSearch =
          provider.name.toLowerCase().contains(searchText.toLowerCase()) ||
          provider.service.toLowerCase().contains(searchText.toLowerCase()) ||
          provider.location.toLowerCase().contains(searchText.toLowerCase());

      return matchesService && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<ProviderModel> list = filteredProviders;

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "What service do you need?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Search trusted workers around your area",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search plumber, tutor, cleaner...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 45,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 12),
            itemCount: widget.services.length,
            itemBuilder: (context, index) {
              String service = widget.services[index];
              bool isSelected = selectedService == service;

              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(service),
                  selected: isSelected,
                  selectedColor: Colors.orange,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  onSelected: (value) {
                    setState(() {
                      selectedService = service;
                    });
                  },
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 6),
          child: Row(
            children: [
              const Text(
                "Available Providers",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text("${list.length} found"),
            ],
          ),
        ),
        Expanded(
          child: list.isEmpty
              ? const Center(
                  child: Text("No provider found"),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ProviderCard(
                      provider: list[index],
                    );
                  },
                ),
        ),
      ],
    );
  }
}