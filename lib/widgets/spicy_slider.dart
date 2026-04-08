import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SpicySlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const SpicySlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Spicy', style: AppTextStyles.sectionTitle.copyWith(fontSize: 16)),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: AppColors.primaryRed,
            inactiveTrackColor: AppColors.searchBarBg,
            thumbColor: AppColors.primaryRed,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            trackHeight: 4,
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
          ),
          child: Slider(
            value: value,
            onChanged: onChanged,
            min: 0,
            max: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mild',
                style: AppTextStyles.bodyText.copyWith(
                  color: AppColors.green,
                  fontSize: 12,
                ),
              ),
              Text(
                'Hot',
                style: AppTextStyles.bodyText.copyWith(
                  color: AppColors.primaryRed,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
