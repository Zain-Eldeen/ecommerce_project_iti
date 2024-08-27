import 'package:e_commerce_app/Widgets/completeWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

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
        centerTitle: true,
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const ContactInformation(),
            const SizedBox(height: 20),
            const AddressSection(),
            const SizedBox(height: 20),
            const PaymentMethodSection(),
            const Spacer(),
            const SummarySection(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const CompleteScreen();
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Payment',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Information',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Icon(Icons.email_outlined),
            SizedBox(width: 10),
            Expanded(child: Text('rumenhussen@gmail.com')),
            Icon(Icons.edit_outlined),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: const [
            Icon(Icons.phone_outlined),
            SizedBox(width: 10),
            Expanded(child: Text('+88-692-764-269')),
            Icon(Icons.edit_outlined),
          ],
        ),
      ],
    );
  }
}

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[200],
          ),
          child: Stack(
            children: [
              // This would be the map or image representation
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: const Center(child: Text('Map Placeholder')),
                ),
              ),
              Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  'Newhall St 36, London, 12908 - UK',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Method',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/paypal-icon-logo-svgrepo-com.svg',
                width: 24,
                height: 20,
              ),
              SizedBox(width: 10),
              Expanded(child: Text('Paypal Card')),
              Icon(Icons.expand_more),
            ],
          ),
        ),
      ],
    );
  }
}

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Subtotal',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\$1250.00',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Shopping',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '\$40.90',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Total Cost',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$1690.99',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
