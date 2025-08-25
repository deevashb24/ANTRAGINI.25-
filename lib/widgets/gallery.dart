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
          crossAxisCount: 1,
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
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0079%20(1).png?alt=media&token=fe94f06c-31ae-4caf-b71a-b057b277858a',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2FIMG_1085%20(1).png?alt=media&token=cd234aaa-a090-4b2f-bbe3-14c162ea50d6',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0082%20(1).png?alt=media&token=89e99d50-355a-4446-8a4e-536cc66dfdad',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0527%20(2).png?alt=media&token=4a637c56-a6cb-4eee-b90f-da22f3d13195',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0510-2.png?alt=media&token=7700ecb8-1350-4799-a590-446b3e93ae7f',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0508-2.png?alt=media&token=44604b7a-3184-4ea6-81dc-31ff14731166',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0475-2.png?alt=media&token=d1bae083-bc03-40a5-8518-a090d8a90074',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0471-2.png?alt=media&token=298d6605-b912-4215-935f-3e5d6f315ed6',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0458-2.png?alt=media&token=1f4cedf5-ff92-4195-8068-e821562ba21e',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0440%20(1).png?alt=media&token=85b32198-e28f-464f-b072-84fa2ad2ff3b',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F_MG_0298%20(1).png?alt=media&token=a3e918f5-770c-4366-ae59-830cb0faa3cc',
          'https://firebasestorage.googleapis.com/v0/b/dev-antaragni.appspot.com/o/gallery%2F1.3_2_11zon.png?alt=media&token=a5a983ba-df26-41d9-b104-398aea0b6a3c',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          '',
          
      
        ];
      case 1:
        return [
          'https://example.com/gallery2_img1.jpg',
          'https://example.com/gallery2_img2.jpg',
        ];
        case 2:
        return [
          'https://example.com/gallery2_img1.jpg',
          'https://example.com/gallery2_img2.jpg',
        ];
        case 3:
        return [
          'https://example.com/gallery2_img1.jpg',
          'https://example.com/gallery2_img2.jpg',
        ];
        case 4:
        return [
          'https://example.com/gallery2_img1.jpg',
          'https://example.com/gallery2_img2.jpg',
        ];
        case 5:
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
