/* Authored by: Gabbie Belarmino, Kathleen Cledera, Ann Russell Cu
Company: DAHU LITRI NITI
Project: Flard
Feature: [FLRD-005] Home Page
Description: The Home Page allows users to access their accounts and navigate to different sections of the app.
 */
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> recentSets = [
    {'title': 'CSDC200 Lesson 9', 'subtitle': '30 cards'},
    {'title': 'CSDC200 Lesson 11', 'subtitle': '20 cards'},
    {'title': 'CSDC: Lesson', 'subtitle': '23 cards'},
  ];

  final List<Map<String, String>> recentFolders = [
    {'title': 'Crochet', 'subtitle': '7 sets'},
    {'title': 'CSDC200', 'subtitle': '4 sets'},
  ];

  final List<Map<String, dynamic>> sharedSets = [
    {'title': 'Hello in 20', 'subtitle': '', 'icon': Icons.home},
    {'title': 'Basic Bisaya Phrases pt.1', 'subtitle': '', 'icon': null},
    {'title': 'Cheat codes', 'subtitle': '', 'icon': Icons.label},
  ];

  // Logout function 
  void logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Auth()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully logged out!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1E3A8A),
        actions: [
          IconButton(
            onPressed: logOut,
            icon: const Icon(Icons.logout),
            color: Colors.white,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0E7FF), Color(0xFFD1D8E7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                color: Color(0xFF1E3A8A), 
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Center(
                  child: Image.asset(
                    'lib/assets/logo.png',
                    width: 250,
                    height: 100,
                  ),
                ),
              ),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Sets, tags, users',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.brown[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              _buildSectionTitle('Recently opened sets'),
              _buildHorizontalCardList(recentSets, includeTagIcon: true),

              _buildSectionTitle('Recently opened folders'),
              _buildHorizontalCardList(recentFolders),

              _buildSectionTitle('Sets shared with you'),
              _buildHorizontalCardList(sharedSets, isShared: true),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildCircularButton(Icons.home, () => print('Home pressed')),
            _buildCircularButton(Icons.add, () => print('Create pressed')),
            _buildCircularButton(Icons.person, () => print('Profile pressed')),
          ],
        ),
      ),
    );
  }


  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF1E3A8A),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }


  Widget _buildHorizontalCardList(List<Map<String, dynamic>> items,
      {bool includeTagIcon = false, bool isShared = false}) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TiltedCard(
              title: items[index]['title']!,
              subtitle: items[index]['subtitle']!,
              icon: isShared ? items[index]['icon'] as IconData? : (includeTagIcon ? Icons.label : null),
            ),
          );
        },
      ),
    );
  }


  Widget _buildCircularButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        backgroundColor: Colors.white,
        elevation: 4,
      ),
      child: Icon(icon, color: Color(0xFF1E3A8A)),
    );
  }
}


class TiltedCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;

  const TiltedCard({required this.title, required this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.05,
      child: Card(
        color: Color(0xFF1E3A8A),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: 120,
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (icon != null && icon != Icons.label) ...[
                    Icon(icon, color: Colors.white, size: 20),
                    const SizedBox(height: 8),
                  ],
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ],
              ),
              if (icon == Icons.label)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Icon(Icons.label, color: Colors.white, size: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }
}