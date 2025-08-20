import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Aftermovie extends StatefulWidget {
  const Aftermovie({super.key});

  @override
  State<Aftermovie> createState() => _Afterstate();
}

class _Afterstate extends State<Aftermovie> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  // Static image and their corresponding URLs
  final List<Map<String, String>> _imageData = [
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2FboF7X5yBEXo-HD%20(1).jpg?alt=media&token=e84dcf9e-3b8d-4a6c-8d9e-d03f7e4219f8',
      'link': 'https://youtu.be/boF7X5yBEXo',
    },
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2FqZmtHBF0AKQ-HD%20(1).jpg?alt=media&token=aebbd10b-203c-476f-b5af-2ce4d156b24b',
      'link': 'https://youtu.be/qZmtHBF0AKQ',
    },
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2FcMoHcuD6vOQ-HD%20(1).jpg?alt=media&token=c2085bb4-140c-49da-abec-72f201fa37bc',
      'link': 'https://youtu.be/cMoHcuD6vOQ',
    },
    

  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _imageData.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20), // Gap from above component

        // --- AFTER MOVIES title with dividers ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Expanded(
                child: Divider(
                  thickness: 1.5,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'AFTER MOVIES',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const Expanded(
                child: Divider(
                  thickness: 1.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // --- Image Slider ---
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _imageData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final imageUrl = _imageData[index]['url']!;
              final link = _imageData[index]['link']!;
              return GestureDetector(
                onTap: () => _launchURL(link),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.fitWidth,
                    
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // --- Page Indicator Dots ---
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_imageData.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == index ? 16 : 8,
              decoration: BoxDecoration(
                color: _currentPage == index ? Colors.blue : Colors.grey,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      const SizedBox(height: 20),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  child: GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    crossAxisSpacing: 16,
    mainAxisSpacing: 16,
    children: [
      _buildNavButton(context, "Sponsors", '/sponsors'),
      _buildNavButton(context, "Website", '/website'),
      _buildNavButton(context, "Core Team", '/coreTeam'),
      _buildNavButton(context, "Queries", '/queries'),
    ],
  ),
),

      ],
    );
  }
}
Widget _buildNavButton(BuildContext context, String title, String route) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black26),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

