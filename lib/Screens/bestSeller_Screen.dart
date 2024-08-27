import 'package:e_commerce_app/Screens/filter_screen.dart';
import 'package:e_commerce_app/Widgets/SearchScreenWidget.dart';
import 'package:flutter/material.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Best Sellers',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () {
               Navigator.push(
              context, MaterialPageRoute(builder: (context) => FilterScreen()));
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
               Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 6, // Total number of products
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 16.0, // Horizontal space between items
            mainAxisSpacing: 16.0, // Vertical space between items
            childAspectRatio: 0.7, // Width to height ratio of each item
          ),
          itemBuilder: (BuildContext context, int index) {
            return _buildProductCard(
              imageUrl: 'https://via.placeholder.com/150',
              title: 'Nike Air Max',
              description: "Men's Shoes",
              price: '\$254.89',
              colors: [Colors.blue, Colors.orange, Colors.pink],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String imageUrl,
    required String title,
    required String description,
    required String price,
    required List<Color> colors,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 1),
            const Text(
              'BEST SELLER',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              description,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              price,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: colors.map((color) {
                return Container(
                  margin: const EdgeInsets.only(right: 4),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
