import 'package:flutter/material.dart';
import 'data/app_data.dart';
import 'models/provider_model.dart';
import 'models/user_model.dart';
import 'pages/auth/sign_in_page.dart';
import 'pages/auth/sign_up_page.dart';
import 'pages/home/home_page.dart';

void main() {
  runApp(const LocalServiceFinderApp());
}

class LocalServiceFinderApp extends StatefulWidget {
  const LocalServiceFinderApp({super.key});

  @override
  State<LocalServiceFinderApp> createState() => _LocalServiceFinderAppState();
}

class _LocalServiceFinderAppState extends State<LocalServiceFinderApp> {
  final List<UserModel> users = List.from(sampleUsers);
  final List<ProviderModel> providers = List.from(sampleProviders);

  UserModel? currentUser;
  bool showSignUpPage = false;

  String? signIn(String email, String password) {
    for (UserModel user in users) {
      if (user.email.toLowerCase() == email.toLowerCase() &&
          user.password == password) {
        setState(() {
          currentUser = user;
        });
        return null;
      }
    }

    return "Invalid email or password";
  }

  String? signUp(UserModel newUser) {
    for (UserModel user in users) {
      if (user.email.toLowerCase() == newUser.email.toLowerCase()) {
        return "Email already exists";
      }
    }

    setState(() {
      users.add(newUser);
      currentUser = newUser;
      showSignUpPage = false;
    });

    return null;
  }

  void logout() {
    setState(() {
      currentUser = null;
      showSignUpPage = false;
    });
  }

  void addProvider(ProviderModel provider) {
    setState(() {
      providers.add(provider);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Local Service Finder",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.orange,
        useMaterial3: true,
      ),
      home: currentUser == null
          ? showSignUpPage
              ? SignUpPage(
                  onSignUp: signUp,
                  onOpenSignIn: () {
                    setState(() {
                      showSignUpPage = false;
                    });
                  },
                )
              : SignInPage(
                  onSignIn: signIn,
                  onOpenSignUp: () {
                    setState(() {
                      showSignUpPage = true;
                    });
                  },
                )
          : HomePage(
              currentUser: currentUser!,
              providers: providers,
              services: appServices,
              onAddProvider: addProvider,
              onLogout: logout,
            ),
    );
  }
}