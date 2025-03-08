import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/mytextfield.dart';
import '../components/my_button.dart';
import '../components/squaretile.dart';
import 'homepage.dart';

class login extends StatelessWidget {
  login({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign user in
  void signUserIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful')),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),

              // Logo
              Image.asset(
                'lib/assets/logo.png',
                width: 250,
                height: 100,
              ),

              SizedBox(height: 50),

              // Welcome message
              Text(
                'The best digital flashcard app',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 25),

              // Username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Username',
                obscureText: false,
              ),

              SizedBox(height: 10),

              // Password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              SizedBox(height: 10),

              // Forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // Sign in button
              MyButton(
                onTap: () => signUserIn(context),
              ),

              SizedBox(height: 50),

              // OR Continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.blue[800],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.blue[800],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Google & Apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/assets/google.png'),
                  SizedBox(width: 25),
                  SquareTile(imagePath: 'lib/assets/apple.png'),
                ],
              ),

              SizedBox(height: 50),

              // Sign up option
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to Sign Up Page
                },
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.blue[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




