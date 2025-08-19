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
    return Stack(
      children: [
        // Background with bending effect under selected icon
        CustomPaint(
          painter: BendPainter(widget.currentIndex),
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            
            height: 50,
          ),
        ),
        // Foreground navigation icons
        Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          height: 70,
          decoration: BoxDecoration(
            color: Colors.transparent, // Already painted below
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: icons.asMap().entries.map((entry) {
              int index = entry.key;
              IconData icon = entry.value;
              bool isSelected = index == widget.currentIndex;

              return GestureDetector(
                onTap: () => widget.onTap(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.deepPurple : Colors.transparent,
                    shape: BoxShape.circle,
                    
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: Colors.deepPurpleAccent.withOpacity(0.5),
                              blurRadius: 50,
                              offset: const Offset(0, 10),
                            )
                          ]
                        : [],
                  ),
                  child: Icon(
                    icon,
                    size:35,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class BendPainter extends CustomPainter {
  final int selectedIndex;

  BendPainter(this.selectedIndex);

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    double iconSpacing = width / 4;

    double centerX = iconSpacing * selectedIndex + iconSpacing / 2;
    double bendRadius = 80;

    Paint paint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.fill;

    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(centerX - bendRadius, 0);
    path.quadraticBezierTo(
      centerX+10,
      150,
      centerX + bendRadius,
      0,
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
