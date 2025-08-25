import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool showAllEvents = false;

  final List<Map<String, String>> events = [
    {
      'title': 'Drumming Battle',
      'time': '20:00',
      'location': 'OAT',
      'date': '26',
      'image':
          'https://facemagazine.in/wp-content/uploads/2023/03/Copy-of-EFFULGENE-154.jpg',
    },
    {
      'title': 'Dance Fiesta',
      'time': '18:00',
      'location': 'Main Stage',
      'date': '27',
      'image':
          'https://facemagazine.in/wp-content/uploads/2023/03/Copy-of-EFFULGENE-154.jpg',
    },
    {
      'title': 'Rock Night',
      'time': '21:00',
      'location': 'Auditorium',
      'date': '28',
      'image':
          'https://facemagazine.in/wp-content/uploads/2023/03/Copy-of-EFFULGENE-154.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    const double headerH = 180;
    const double avatarR = 50;
    const double overlap = avatarR; // half-on header, half-on white sheet
    final double whiteTop = headerH - overlap;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ===== TOP: header + avatar + white sheet (SCROLLS TOGETHER) =====
            SizedBox(
              height: whiteTop + 190, // enough to hold "Hello" + counters
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Purple header
                  SizedBox(
                    height: headerH,
                    width: double.infinity,
                    child: CustomPaint(painter: _HeaderPainter()),
                  ),

                  // Back button
                  Positioned(
                    top: 40,
                    left: 12,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  // White curved sheet
                  Positioned(
                    top: whiteTop,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(28),
                        bottomRight: Radius.circular(28),
                      ),
                      child: Container(
                        color: Colors.white,
                        padding:
                            const EdgeInsets.only(top: avatarR + 10, bottom: 16),
                        child: Column(
                          children: [
                            const Text(
                              "Hello, Harshit",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 14),

                            // Steps & Calories
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 6,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: const [
                                        Text(
                                          "7,297",
                                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "STEPS",
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 40,
                                      width: 1,
                                      color: Colors.grey.shade300,
                                    ),
                                    Column(
                                      children: const [
                                        Text(
                                          "379cal",
                                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          "CALORIES",
                                          style: TextStyle(fontSize: 12, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),                            
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Avatar — now INSIDE this Stack, so it scrolls with everything
                  Positioned(
                    top: headerH - avatarR - 57,
                    left: (w / 2) - avatarR,
                    child: CircleAvatar(
                      radius: avatarR + 3,
                      backgroundColor: Colors.white, // white ring
                      child: const CircleAvatar(
                        radius: avatarR,
                        backgroundImage: AssetImage("assets/profile.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // ===== CYCLE CARD (358x217) =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: w - 32,
                child: AspectRatio(
                  aspectRatio: 358 / 217,
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    clipBehavior: Clip.antiAlias,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            "assets/cyclecard.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 18,
                          child: SizedBox(
                            width: w * 0.48,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ride thru Antaragni",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "Move around the campus hassle-free",
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          bottom: 16,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text("Rent Now"),
                          ),
                        ),
                        Positioned(
                          right: -6,
                          top: 6,
                          child: Image.asset(
                            "assets/cycle.png",
                            height: 160,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 22),

            // ===== REGISTERED EVENTS =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Registered Events",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => showAllEvents = !showAllEvents),
                    child: Text(
                      showAllEvents ? "See less" : "See all",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            AnimatedSize(
              duration: const Duration(milliseconds: 420),
              curve: Curves.easeInOut,
              child: showAllEvents
                  ? Column(
                      children: List.generate(
                        events.length,
                        (i) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: EventCard(
                            event: events[i],
                            width: w - 32,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 360,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            bottom: 60,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                width: (w - 32) * 0.82,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 70,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Container(
                                width: (w - 32) * 0.9,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: 42,
                          //   left: 0,
                          //   right: 0,
                          //   child: Center(
                          //     child: Transform.scale(
                          //       scale: 0.92,
                          //       child: EventCard(
                          //         event: events[1],
                          //         width: w - 32,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: EventCard(
                                event: events[0],
                                width: w - 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}

/// Header painter (two-tone purple with soft ellipses)
class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF4A90E2), Color(0xFF6A5ACD)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..lineTo(0, size.height - 40)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - 40)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(path, paint);

    final ellipse = Paint()..color = Colors.white.withOpacity(0.14);
    canvas.drawOval(
        Rect.fromCircle(center: Offset(size.width * .78, 40), radius: 58),
        ellipse);
    canvas.drawOval(
        Rect.fromCircle(center: Offset(size.width * .22, 88), radius: 42),
        ellipse);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Event card (358x308)
class EventCard extends StatelessWidget {
  final Map<String, String> event;
  final double width;

  const EventCard({Key? key, required this.event, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: 358 / 308,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(event['image']!, fit: BoxFit.cover),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Colors.black54, Colors.transparent],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(event['time']!,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 12)),
                        const SizedBox(width: 10),
                        Text(event['location']!,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Oct ${event['date']}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}