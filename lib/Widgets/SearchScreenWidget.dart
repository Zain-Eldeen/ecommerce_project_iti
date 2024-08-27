import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: const Text(
            'Search',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Cancel search logic
            },
            child: const Text('Cancel', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Your Shoes',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Shoes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
             Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Nike Air Max Shoes'),
                    leading: Icon(Icons.radio_button_checked, color: Colors.grey),
                  ),
                  ListTile(
                    title: Text('Nike Jordan Shoes'),
                    leading: Icon(Icons.radio_button_unchecked, color: Colors.grey),
                  ),
                  ListTile(
                    title: Text('Nike Air Force Shoes'),
                    leading: Icon(Icons.radio_button_unchecked, color: Colors.grey),
                  ),
                  ListTile(
                    title: Text('Nike Club Max Shoes'),
                    leading: Icon(Icons.radio_button_unchecked, color: Colors.grey),
                  ),
                  ListTile(
                    title: Text('Sneakers Nike Shoes'),
                    leading: Icon(Icons.radio_button_unchecked, color: Colors.grey),
                  ),
                  ListTile(
                    title: Text('Regular Shoes'),
                    leading: Icon(Icons.radio_button_unchecked, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
