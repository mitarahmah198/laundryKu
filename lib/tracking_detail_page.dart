// tracking_detail_page.dart
import 'package:flutter/material.dart';

class TrackingDetailPage extends StatelessWidget {
  const TrackingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Laundry Bersih Jaya',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            TrackingItem(
              title: 'Diterima',
              isActive: true,
            ),
            TrackingItem(
              title: 'Dicuci',
              isActive: true,
            ),
            TrackingItem(
              title: 'Disetrika',
              isActive: false,
            ),
            TrackingItem(
              title: 'Siap Diantar',
              isActive: false,
            ),

            const Spacer(),

            ElevatedButton(
              onPressed: () {},
              child: const Text('Hubungi Laundry'),
            ),
          ],
        ),
      ),
    );
  }
}

class TrackingItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const TrackingItem({
    super.key,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        isActive ? Icons.check_circle : Icons.radio_button_unchecked,
        color: isActive ? Colors.blue : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }
}