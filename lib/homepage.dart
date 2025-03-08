import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  login()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Successfully logged out!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('HomePage building');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        actions: [
          IconButton(
            onPressed: () => logOut(context),
            icon: const Icon(Icons.logout),
            color: Colors.white,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: const Center(child: Text("LOGGED IN!")),
    );
  }
}
