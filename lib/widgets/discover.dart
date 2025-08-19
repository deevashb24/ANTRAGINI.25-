import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  // Static image and their corresponding URLs
  final List<Map<String, String>> _imageData = [
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2FWhatsApp%20Image%202023-10-22%20at%2010.43.26%20AM.jpeg?alt=media&token=c5579d4b-7335-4ae6-824b-602753aef9f2',
      'link': 'https://www.instagram.com/p/CysEiCwR6Px/',
    },
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2FScreenshot%202023-10-21%20104917.png?alt=media&token=7af324aa-c845-41cc-9823-872442dd73b0',
      'link': 'https://www.instagram.com/p/CypgsETIgn4/',
    },
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2FScreenshot%202023-10-21%20125818.png?alt=media&token=9dee7ac4-e57b-47f1-828f-8b567b9796d1',
      'link': 'https://www.instagram.com/p/CypelH4oMNz/',
    },
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2FScreenshot%202023-10-21%20125935.png?alt=media&token=bf14b97d-82b0-4eba-9e88-98afac14104a',
      'link': 'https://www.instagram.com/p/CypebkPI-Gg/',
    },
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2F393236204_299198952893223_2279609462426602372_n.webp?alt=media&token=49cd1a37-fd48-4f59-acac-c8828e265389',
      'link': 'https://www.instagram.com/p/Cyi4sp7N_b5/',
    },
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2F392746017_184667374681451_7260714113028534392_n%20(1).webp?alt=media&token=885947fd-6a96-4c04-95bc-440e36f3c293',
      'link': '',      
    },
    {
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2F392746017_184667374681451_7260714113028534392_n%20(1).webp?alt=media&token=885947fd-6a96-4c04-95bc-440e36f3c293',
      'link': '',      
    },{
      'url': 'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2F393179747_1083795059716449_478060811905577158_n.heic?alt=media&token=ef483007-e850-445b-86e0-103b21cae6cb',
      'link': 'https://www.instagram.com/p/CymBWa9IA9q/?img_index=1',      
    }

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

        // --- DISCOVER title with dividers ---
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
                  'DISCOVER',
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
          height: 400,
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
      ],
    );
  }
}
