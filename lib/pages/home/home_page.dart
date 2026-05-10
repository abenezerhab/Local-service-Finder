import 'package:flutter/material.dart';
import '../../models/provider_model.dart';
import '../../models/user_model.dart';
import '../../widgets/app_drawer.dart';
import 'profile_page.dart';
import 'register_worker_page.dart';
import 'search_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  final UserModel currentUser;
  final List<ProviderModel> providers;
  final List<String> services;
  final Function(ProviderModel provider) onAddProvider;
  final VoidCallback onLogout;

  const HomePage({
    super.key,
    required this.currentUser,
    required this.providers,
    required this.services,
    required this.onAddProvider,
    required this.onLogout,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void addProviderFromForm(ProviderModel provider) {
    widget.onAddProvider(provider);

    setState(() {
      currentIndex = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Worker registered successfully"),
      ),
    );
  }

  String getTitle() {
    if (currentIndex == 0) {
      return "Find Services";
    } else if (currentIndex == 1) {
      return "Register Worker";
    } else if (currentIndex == 2) {
      return "Profile";
    } else {
      return "Settings";
    }
  }

  Widget getPage() {
    if (currentIndex == 0) {
      return SearchPage(
        providers: widget.providers,
        services: widget.services,
      );
    } else if (currentIndex == 1) {
      return RegisterWorkerPage(
        services: widget.services,
        onAddProvider: addProviderFromForm,
      );
    } else if (currentIndex == 2) {
      return ProfilePage(
        currentUser: widget.currentUser,
        providerCount: widget.providers.length,
      );
    } else {
      return SettingsPage(
        currentUser: widget.currentUser,
        onLogout: widget.onLogout,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        currentUser: widget.currentUser,
        currentIndex: currentIndex,
        onPageSelected: changePage,
        onLogout: widget.onLogout,
      ),
      appBar: AppBar(
        title: Text(getTitle()),
        centerTitle: true,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: changePage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: "Register",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}