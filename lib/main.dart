import 'package:flutter/material.dart';
import 'widgets/bottom_nav.dart';
import 'widgets/top_bar.dart';
import 'widgets/steps_calories.dart';
import 'widgets/discover.dart';
import 'widgets/gallery.dart';
import 'widgets/Brochure.dart';
import 'widgets/EventsPage.dart';
import 'widgets/MediaPage.dart';
import 'widgets/antaragni_journey_page.dart';
import 'widgets/aftermovie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Antaragni App',
      theme: ThemeData(
        fontFamily: 'Helvetica',
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const NavigationController(),
      routes: {
        '/antaragniJourney': (context) => const AntaragniJourneyPage(),
        '/events': (context) => const Eventspage(),
        '/media': (context) => const Mediapage(),
        '/brochure': (context) => const Brochure(),
      },
    );
  }
}

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  _NavigationControllerState createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    MapPage(),
    StatsPage(),
    ProfilePage(),
  ];

  bool get isFabSelected => currentIndex == 1; // Example logic for FAB state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: pages[currentIndex],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TopBar(),
              SizedBox(height: 20),
              StepsAndCalories(),
              SizedBox(height: 20),
              Discover(),
              SizedBox(height: 20),
              Gallery(),
              SizedBox(height:20),
              Aftermovie(),
            ],
          ),
        ),
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          'Map Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          'Stats Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(
        child: Text(
          'Profile Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
