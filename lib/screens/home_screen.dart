import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signup/constants/constants.dart';
import 'package:signup/widgets/snackbar.dart';
import 'signup_screen.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  /// Sign out and clear GoogleSignIn instance
  void _signOut(BuildContext context) async {
    try {
      await GoogleSignIn().disconnect(); // Disconnect Google account
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        ),
      );
    } catch (e) {
      showSnackBar(context, 'Error signing out:$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kSizedBoxHeight20,
            Text(
              'Name: ${user.displayName}',
              style: const TextStyle(fontSize: 18),
            ),
            kSizedBoxHeight10,
            Text(
              'Email: ${user.email}',
              style: const TextStyle(fontSize: 16),
            ),
            kSizedBoxHeight20,
            ElevatedButton(
              onPressed: () => _signOut(context),
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
