import 'package:e_commerce_app/Screens/checkout_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('My Cart'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  cartItem(
                      'Nike Club Max', 'L', '64.95', 'assets/images/1.png'),
                  cartItem(
                      'Nike Air Max', 'XL', '64.95', 'assets/images/2.png'),
                  cartItem(
                      'Nike Air Max', 'XXL', '64.95', 'assets/images/3.png'),
                ],
              ),
            ),
            const Divider(thickness: 2),
            summaryRow('Subtotal', '\$1250.00'),
            const SizedBox(height: 10),
            summaryRow('Shopping', '\$40.90'),
            const SizedBox(height: 20),
            summaryRow('Total Cost', '\$1690.99', isTotal: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CheckOutScreen();
                }));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cartItem(String name, String size, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 60,
            height: 60,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text('\$$price', style: const TextStyle(color: Colors.grey)),
            ],
          ),
          const Spacer(),
          Text(size, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          const SizedBox(width: 10),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {},
              ),
              const Text('1', style: TextStyle(fontSize: 16)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {},
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget summaryRow(String label, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
