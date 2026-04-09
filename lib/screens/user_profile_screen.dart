import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Red gradient background (full screen)
          Container(
            width: double.infinity,
            height: 280,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  AppColors.profileGradientStart,
                  AppColors.profileGradientEnd,
                ],
              ),
            ),
          ),

          // Back arrow
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 26,
              ),
            ),
          ),

          // Settings icon
          Positioned(
            top: 50,
            right: 20,
            child: const Icon(
              Icons.settings_outlined,
              color: AppColors.white,
              size: 26,
            ),
          ),

          // White rounded card overlapping the red header
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(28, 65, 28, 24),
                child: Column(
                  children: [
                    _buildOutlinedField('Name', 'Sophia Patel'),
                    const SizedBox(height: 20),
                    _buildOutlinedField('Email', 'sophiapatel@gmail.com'),
                    const SizedBox(height: 20),
                    _buildOutlinedField('Delivery address',
                        '123 Main St Apartment 4A,New York, NY'),
                    const SizedBox(height: 20),
                    _buildOutlinedField(
                        'Password', '● ● ● ● ● ● ● ● ● ●',
                        isPassword: true),
                    const SizedBox(height: 28),

                    // Divider
                    Divider(
                        color: AppColors.inputFieldBorder, thickness: 0.8),
                    const SizedBox(height: 16),

                    // Payment Details
                    _buildMenuRow('Payment Details'),
                    const SizedBox(height: 8),
                    _buildMenuRow('Order history'),
                    const SizedBox(height: 40),

                    // Buttons
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: AppColors.darkBrown,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Edit Profile',
                                  style: AppTextStyles.buttonText
                                      .copyWith(fontSize: 14),
                                ),
                                const SizedBox(width: 6),
                                const Icon(
                                  Icons.edit_outlined,
                                  color: AppColors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                  color: AppColors.primaryRed, width: 1.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Log out',
                                  style: AppTextStyles.buttonText.copyWith(
                                    color: AppColors.primaryRed,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(
                                  Icons.logout,
                                  color: AppColors.primaryRed,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

          // Profile photo — sits on the edge of red and white
          Positioned(
            top: 115,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 95,
                height: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: AppColors.primaryRed.withValues(alpha: 0.7),
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/profile_avatar.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOutlinedField(String label, String value,
      {bool isPassword = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 12),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.inputFieldBorder, width: 1),
          ),
          child: Text(value, style: AppTextStyles.fieldValue),
        ),
        Positioned(
          left: 12,
          top: -8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            color: AppColors.background,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTextStyles.bodyText.copyWith(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                if (isPassword) ...[
                  const SizedBox(width: 4),
                  Icon(Icons.lock_outline,
                      size: 12, color: AppColors.textSecondary),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuRow(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.fieldValue),
          const Icon(
            Icons.chevron_right,
            color: AppColors.textSecondary,
            size: 22,
          ),
        ],
      ),
    );
  }
}
