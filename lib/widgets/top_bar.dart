import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'notification.dart';
import 'profile.dart'; 

class TopBar extends StatelessWidget {
  final List<Map<String, dynamic>> notifications;

  const TopBar({super.key, this.notifications = const []});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 🔹 Background Image
        Container(
          height: 120,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/HomeBG.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // 🔹 Foreground content
        Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Festival logo
              Image.asset(
                "assets/antaragni.png",
                height: 45,
                fit: BoxFit.contain,
              ),

              // Notification + Profile
              Row(
                children: [
                  // Notifications Icon with navigation
                  IconButton(
                    icon: const Icon(Icons.notifications_none,
                        color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Notifications(
                            notifications: notifications,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(width: 12),

                  // Profile avatar / icon
                  IconButton(
                    icon: const Icon(Icons.account_circle,
                        color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
