import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MediaPage extends StatelessWidget {
  const MediaPage({super.key});

  // Example media partners data
  final List<Map<String, String>> media = const [
    {
      "name": "The Indian Express",
      "logo": "https://upload.wikimedia.org/wikipedia/en/5/56/The_Indian_Express_logo.png",
      "link": "https://indianexpress.com/",
      "color": "0xFFFFE0B2" // light orange
    },
    {
      "name": "Dainik Jagran",
      "logo": "https://upload.wikimedia.org/wikipedia/commons/3/3e/Dainik_Jagran_Logo.png",
      "link": "https://www.jagran.com/",
      "color": "0xFFFFFF99" // light yellow
    },
    {
      "name": "The Times of India",
      "logo": "https://upload.wikimedia.org/wikipedia/en/1/12/The_Times_of_India_logo.png",
      "link": "https://timesofindia.indiatimes.com/",
      "color": "0xFFFFE0B2" // beige
    },
    {
      "name": "Amar Ujala",
      "logo": "https://upload.wikimedia.org/wikipedia/commons/7/7b/Amar_Ujala_logo.png",
      "link": "https://www.amarujala.com/",
      "color": "0xFFB2DFDB" // mint green
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
        title: const Text("Media"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: media.length,
        itemBuilder: (context, index) {
          final sponsor = media[index];
          return GestureDetector(
            onTap: () => _launchURL(sponsor['link']!),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(int.parse(sponsor['color']!)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  sponsor['logo']!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 40),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
