import 'package:e_commerce_app/Screens/NotificationsScreen.dart';
import 'package:e_commerce_app/Screens/cart_screen.dart';
import 'package:e_commerce_app/Screens/favorites_screen.dart';
import 'package:e_commerce_app/Screens/loginScreen.dart';
import 'package:e_commerce_app/Screens/profile_screen.dart';
import 'package:e_commerce_app/Screens/settings_screen.dart';

import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF1E2026), // Dark background color
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1E2026), // Same dark color as the background
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/e2eb8a7e50f18391d3f1877c7adab884.png'), // Replace with actual image
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        'Hey,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '👋', // Wave emoji
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  Text(
                    'Alisson Becker',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildMenuItem(Icons.person_outline, 'Profile', context,
                      ProfileScreen()),
                  _buildMenuItem(Icons.shopping_bag_outlined, 'My Cart',
                      context, CartScreen()),
                  _buildMenuItem(Icons.favorite_border, 'Favorite', context,
                      FavoriteScreen()),
                  _buildMenuItem(Icons.settings_outlined, 'Settings', context,
                      SettingsScreen()),
                  _buildMenuItem(Icons.notifications_outlined, 'Notifications',
                      context, NotificationsScreen()),
                  Divider(color: Colors.white24),
                  _buildMenuItem(
                      Icons.logout, 'Sign Out', context, LoginScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      IconData icon, String title, BuildContext context, Widget destination) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 24),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    );
  }
}
