import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback? onFabTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.onFabTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Curved red bar
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 60),
            painter: _CurvedNavPainter(),
          ),
          // FAB button
          Positioned(
            top: -12,
            child: GestureDetector(
              onTap: onFabTap ?? () {},
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primaryRed,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryRed.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 28,
                ),
              ),
            ),
          ),
          // Nav items
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navIcon(Icons.home_rounded, 0),
                _navIcon(Icons.person_outline, 1),
                const SizedBox(width: 56), // Space for FAB
                _navIcon(Icons.chat_bubble_outline, 2),
                _navIcon(Icons.favorite, 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navIcon(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 26,
      ),
    );
  }
}

class _CurvedNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryRed
      ..style = PaintingStyle.fill;

    final path = Path();
    final midX = size.width / 2;
    const notchRadius = 34.0; // Matches FAB radius + gap

    // Start bottom-left, go up to top-left with rounded corner
    path.moveTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);

    // Top edge → approach notch
    path.lineTo(midX - notchRadius - 12, 0);

    // Smooth curve down into the notch
    path.quadraticBezierTo(midX - notchRadius, 0, midX - notchRadius, notchRadius * 0.45);

    // Deep semicircular notch
    path.arcToPoint(
      Offset(midX + notchRadius, notchRadius * 0.45),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );

    // Smooth curve back up from notch
    path.quadraticBezierTo(midX + notchRadius, 0, midX + notchRadius + 12, 0);

    // Top edge → top-right rounded corner
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);

    // Right edge → bottom → left edge
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
