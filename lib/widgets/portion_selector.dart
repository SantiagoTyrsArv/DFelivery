import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PortionSelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const PortionSelector({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Portion',
          style: AppTextStyles.sectionTitle.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _circleButton(Icons.remove, onDecrement),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                quantity.toString(),
                style: AppTextStyles.sectionTitle.copyWith(fontSize: 18),
              ),
            ),
            _circleButton(Icons.add, onIncrement),
          ],
        ),
      ],
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.primaryRed,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.white, size: 20),
      ),
    );
  }
}
