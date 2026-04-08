import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // Curved red bar
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 70),
            painter: _CurvedNavPainter(),
          ),
          // FAB button
          Positioned(
            top: -20,
            child: GestureDetector(
              onTap: () {},
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
                _navIcon(Icons.emoji_emotions_outlined, 2),
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

    path.moveTo(0, 20);
    path.quadraticBezierTo(0, 0, 20, 0);
    path.lineTo(midX - 40, 0);
    path.quadraticBezierTo(midX - 20, 0, midX - 20, 20);
    path.arcToPoint(
      Offset(midX + 20, 20),
      radius: const Radius.circular(24),
      clockwise: false,
    );
    path.quadraticBezierTo(midX + 20, 0, midX + 40, 0);
    path.lineTo(size.width - 20, 0);
    path.quadraticBezierTo(size.width, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
