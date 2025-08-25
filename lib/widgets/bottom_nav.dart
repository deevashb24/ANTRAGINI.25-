import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<IconData> icons = [
    Icons.home,
    Icons.map,
    Icons.calendar_today,
    Icons.movie,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // ✅ Ensures the bar has a fixed height
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Background with bending effect
          Positioned.fill(
            child: CustomPaint(
              painter: BendPainter(widget.currentIndex, icons.length),
            ),
          ),

          // Foreground navigation icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: icons.asMap().entries.map((entry) {
              int index = entry.key;
              IconData icon = entry.value;
              bool isSelected = index == widget.currentIndex;

              return GestureDetector(
                onTap: () => widget.onTap(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.deepPurple : Colors.transparent,
                    shape: BoxShape.circle,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.deepPurpleAccent.withOpacity(0.5),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            )
                          ]
                        : [],
                  ),
                  child: Icon(
                    icon,
                    size: 30,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class BendPainter extends CustomPainter {
  final int selectedIndex;
  final int itemCount;

  BendPainter(this.selectedIndex, this.itemCount);

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    // spacing per icon
    double iconSpacing = width / itemCount;

    // center of selected icon
    double centerX = iconSpacing * selectedIndex + iconSpacing / 2;

    double bendRadius = 60; // smaller so it doesn't overflow

    Paint paint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(centerX - bendRadius, 0);

    path.quadraticBezierTo(
      centerX, height * 0.8, // bend depth
      centerX + bendRadius, 0,
    );

    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BendPainter oldDelegate) =>
      oldDelegate.selectedIndex != selectedIndex;
}
