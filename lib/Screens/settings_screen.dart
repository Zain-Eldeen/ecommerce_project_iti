import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Account & Settings',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.notifications_none),
              title: const Text('Notification Setting'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Notification Settings
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_shipping_outlined),
              title: const Text('Shipping Address'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Shipping Address
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment_outlined),
              title: const Text('Payment Info'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Payment Info
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Delete Account'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Delete Account
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'App Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              activeColor: Colors.blue,
              title: const Text('Enable Face ID For Log In'),
              value: false,
              onChanged: (bool value) {
                // Handle toggle change
              },
            ),
            SwitchListTile(
              activeColor: Colors.blue,
              title: const Text('Enable Push Notifications'),
              value: true,
              onChanged: (bool value) {
                // Handle toggle change
              },
            ),
            SwitchListTile(
              activeColor: Colors.blue,
              title: const Text('Enable Location Services'),
              value: true,
              onChanged: (bool value) {
                // Handle toggle change
              },
            ),
            SwitchListTile(
              activeColor: Colors.blue,
              title: const Text('Dark Mode'),
              value: false,
              onChanged: (bool value) {
                // Handle toggle change
              },
            ),
          ],
        ),
      ),
    );
  }
}
