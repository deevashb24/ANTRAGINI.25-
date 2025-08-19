import 'dart:async';
import 'package:flutter/material.dart';

/// ---------------- Photo Gallery Page ----------------
class PhotoGalleryPage extends StatelessWidget {
  final String title;
  final List<String> photos;

  const PhotoGalleryPage({
    super.key,
    required this.title,
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              photos[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

/// ---------------- Gallery Section ----------------
class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  // Static images for slider
  final List<String> _imageUrls = [
    'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2Fp69.jpg?alt=media&token=5d7eb45d-95ca-475c-9c42-e4a5409257de',
    'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2Fp13.jpg?alt=media&token=90b344e6-00ad-409f-a67f-14c8e6eb58e9',
    'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2Fp38.jpg?alt=media&token=7d6db8bb-ab82-439b-928e-dd26a1c0e168',
    'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2Fp35.jpg?alt=media&token=b50f54d7-5aef-4db3-83a3-3fca1da4b108',
    'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2Fp20.jpg?alt=media&token=1b506349-755a-4d4a-b01c-f9167930b40c',
    'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/appLandingPage%2Fp43.jpg?alt=media&token=a1f5b2fc-df71-43ee-8245-45a34b9f6711',
  ];

  // Grouped gallery photos
  List<String> _getGalleryPhotos(int index) {
    switch (index) {
      case 0:
        return [
          'https://example.com/gallery1_img1.jpg',
          'https://example.com/gallery1_img2.jpg',
          'https://example.com/gallery1_img3.jpg',
        ];
      case 1:
        return [
          'https://example.com/gallery2_img1.jpg',
          'https://example.com/gallery2_img2.jpg',
        ];
      default:
        return [
          'https://example.com/default_img1.jpg',
        ];
    }
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % _imageUrls.length;
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),

        // --- Title ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Expanded(child: Divider(thickness: 1.5, color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'GALLERY',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              const Expanded(child: Divider(thickness: 1.5, color: Colors.grey)),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // --- Slider ---
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _imageUrls.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PhotoGalleryPage(
                        title: 'Gallery ${index + 1}',
                        photos: _getGalleryPhotos(index),
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    _imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // --- Dots ---
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_imageUrls.length, (index) {
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

        const SizedBox(height: 40),

        // --- Navigation Buttons ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              _buildNavButton(context, "Antaragni's Journey", '/antaragniJourney'),
              _buildNavButton(context, "Events", '/events'),
              _buildNavButton(context, "Media", '/media'),
              _buildNavButton(context, "Brochure", '/brochure'),
            ],
          ),
        ),
      ],
    );
  }
}
