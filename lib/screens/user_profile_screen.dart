import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Red curved header with profile photo
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              // Red gradient header
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 1.2,
                    colors: [
                      AppColors.profileGradientStart,
                      AppColors.profileGradientEnd,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
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
                  Icons.settings,
                  color: AppColors.white,
                  size: 26,
                ),
              ),

              // Profile photo
              Positioned(
                bottom: -40,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.white, width: 3),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile_avatar.png'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),

          // Form fields
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  _buildField('Name', 'Sophia Patel'),
                  const SizedBox(height: 16),
                  _buildField('Email', 'sophiapatel@gmail.com'),
                  const SizedBox(height: 16),
                  _buildField('Delivery address',
                      '123 Main St Apartment 4A,New York, NY'),
                  const SizedBox(height: 16),
                  _buildField('Password', '••••••••••', isPassword: true),
                  const SizedBox(height: 24),

                  // Divider
                  Divider(color: AppColors.inputFieldBorder, thickness: 1),
                  const SizedBox(height: 16),

                  // Payment Details
                  _buildMenuRow('Payment Details'),
                  const SizedBox(height: 8),
                  _buildMenuRow('Order history'),
                  const SizedBox(height: 32),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: AppColors.darkBrown,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Edit Profile',
                                style: AppTextStyles.buttonText.copyWith(
                                    fontSize: 14),
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
                          padding: const EdgeInsets.symmetric(vertical: 14),
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
        ],
      ),
    );
  }

  Widget _buildField(String label, String value, {bool isPassword = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.inputFieldBg,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.inputFieldBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label, style: AppTextStyles.fieldLabel),
              if (isPassword) ...[
                const SizedBox(width: 4),
                Icon(Icons.lock_outline,
                    size: 14, color: AppColors.textSecondary),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.fieldValue),
        ],
      ),
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
