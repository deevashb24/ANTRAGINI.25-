import 'package:flutter/material.dart';
import 'notification.dart'; // 👈 Import the Notifications screen

class TopBar extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;

  const TopBar({super.key, this.notifications = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 12,
        right: 12,
        bottom: 12,
      ),
      
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Image.asset(
                'assets/your_image.jpg',
                width: 1000,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notifications(
                      notifications: notifications,
                    ),
                  ),
                );
              },
              child: const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 40,
              ),
            ),
            const SizedBox(width: 16),
            const CircleAvatar(radius: 20, backgroundColor: Colors.white54),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
