import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  // Example organizers data
  final List<Map<String, String>> contacts = const [
    {
      "name": "Harshit",
      "role": "Organiser, Hospitality and Transport",
      "img": "https://i.pravatar.cc/100?img=1",
      "phone": "tel:+911234567890",
      "linkedin": "https://linkedin.com",
      "facebook": "https://facebook.com",
      "email": "mailto:harshit@email.com",
    },
    {
      "name": "Ishaan",
      "role": "Organiser, Hospitality and Transport",
      "img": "https://i.pravatar.cc/100?img=2",
      "phone": "tel:+911234567891",
      "linkedin": "https://linkedin.com",
      "facebook": "https://facebook.com",
      "email": "mailto:ishaan@email.com",
    },
    {
      "name": "Himanshu",
      "role": "Organiser, Hospitality and Transport",
      "img": "https://i.pravatar.cc/100?img=3",
      "phone": "tel:+911234567892",
      "linkedin": "https://linkedin.com",
      "facebook": "https://facebook.com",
      "email": "mailto:himanshu@email.com",
    },
    {
      "name": "Manish Kajla",
      "role": "Organiser, Hospitality and Transport",
      "img": "https://i.pravatar.cc/100?img=4",
      "phone": "tel:+911234567893",
      "linkedin": "https://linkedin.com",
      "facebook": "https://facebook.com",
      "email": "mailto:manish@email.com",
    },
    {
      "name": "Anurag",
      "role": "Organiser, Hospitality and Transport",
      "img": "https://i.pravatar.cc/100?img=5",
      "phone": "tel:+911234567894",
      "linkedin": "https://linkedin.com",
      "facebook": "https://facebook.com",
      "email": "mailto:anurag@email.com",
    },
  ];

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("For any Queries, Please Contact"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final person = contacts[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade300,
            ),
            child: Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(person['img']!),
                ),
                const SizedBox(width: 12),
                // Name and role
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        person['role']!,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                // Action icons
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.phone, color: Colors.black),
                      onPressed: () => _launchURL(person['phone']!),
                    ),
                    IconButton(
                      icon: const Icon(Icons.linked_camera, color: Colors.black),
                      onPressed: () => _launchURL(person['linkedin']!),
                    ),
                    IconButton(
                      icon: const Icon(Icons.facebook, color: Colors.black),
                      onPressed: () => _launchURL(person['facebook']!),
                    ),
                    IconButton(
                      icon: const Icon(Icons.email, color: Colors.black),
                      onPressed: () => _launchURL(person['email']!),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
