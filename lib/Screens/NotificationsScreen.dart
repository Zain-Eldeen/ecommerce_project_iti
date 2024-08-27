import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
          'Notifications',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add functionality to clear all notifications
            },
            child: const Text(
              'Clear All',
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 16),
          const Text(
            'Today',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildNotificationItem(
            imageUrl: 'https://via.placeholder.com/100',
            title: 'We Have New Products With Offers',
            oldPrice: '\$364.95',
            newPrice: '\$260.00',
            timeAgo: '6 min ago',
            isNew: true,
          ),
          const SizedBox(height: 10),
          _buildNotificationItem(
            imageUrl: 'https://via.placeholder.com/100',
            title: 'We Have New Products With Offers',
            oldPrice: '\$364.95',
            newPrice: '\$260.00',
            timeAgo: '26 min ago',
            isNew: true,
          ),
          const SizedBox(height: 30),
          const Text(
            'Yesterday',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildNotificationItem(
            imageUrl: 'https://via.placeholder.com/100',
            title: 'We Have New Products With Offers',
            oldPrice: '\$364.95',
            newPrice: '\$260.00',
            timeAgo: '4 days ago',
            isNew: false,
          ),
          const SizedBox(height: 10),
          _buildNotificationItem(
            imageUrl: 'https://via.placeholder.com/100',
            title: 'We Have New Products With Offers',
            oldPrice: '\$364.95',
            newPrice: '\$260.00',
            timeAgo: '4 days ago',
            isNew: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String imageUrl,
    required String title,
    required String oldPrice,
    required String newPrice,
    required String timeAgo,
    required bool isNew,
  }) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$oldPrice $newPrice',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              timeAgo,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            if (isNew)
              const Icon(
                Icons.circle,
                color: Colors.blue,
                size: 10,
              )
            else
              const Icon(
                Icons.circle,
                color: Colors.white,
                size: 10,
              ),
          ],
        ),
      ],
    );
  }
}
