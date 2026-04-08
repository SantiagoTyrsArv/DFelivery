import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'success_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedPayment = 0; // 0 = credit, 1 = debit
  bool _saveCard = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back,
                              color: AppColors.textPrimary,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Order summary
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Order summary',
                        style: AppTextStyles.sectionTitle
                            .copyWith(color: AppColors.primaryRed),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Order item
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.searchBarBg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/burgers/cheeseburger.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cheeseburger Wendy's",
                                    style: AppTextStyles.productName,
                                  ),
                                  Text(
                                    'x2',
                                    style: AppTextStyles.bodyText,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '\$8.24',
                              style: AppTextStyles.productName,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Delivery address
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Delivery address',
                        style: AppTextStyles.sectionTitle
                            .copyWith(color: AppColors.primaryRed),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.searchBarBg,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined,
                                color: AppColors.primaryRed, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '123 Main St Apartment 4A, New York, NY',
                                style: AppTextStyles.bodyText
                                    .copyWith(color: AppColors.textPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Estimated delivery
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Estimated delivery time:',
                              style: AppTextStyles.bodyText),
                          Text(
                            '15 - 30mins',
                            style: AppTextStyles.productName,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Payment methods
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Payment methods',
                        style: AppTextStyles.sectionTitle
                            .copyWith(color: AppColors.primaryRed),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Credit card
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPayment = 0;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.creditCardDark,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              // Mastercard logo
                              SizedBox(
                                width: 40,
                                height: 30,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade700,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 12,
                                      child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade700,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Credit card',
                                      style: AppTextStyles.productName
                                          .copyWith(color: AppColors.white),
                                    ),
                                    Text(
                                      '5105 **** **** 0505',
                                      style: AppTextStyles.bodyText
                                          .copyWith(color: Colors.grey[400]),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                _selectedPayment == 0
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: AppColors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Debit card (Visa)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedPayment = 1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.searchBarBg,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              // Visa logo
                              Text(
                                'VISA',
                                style: AppTextStyles.detailTitle.copyWith(
                                  color: const Color(0xFF1A1F71),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Debit card',
                                      style: AppTextStyles.productName,
                                    ),
                                    Text(
                                      '3566 **** **** 0505',
                                      style: AppTextStyles.bodyText,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                _selectedPayment == 1
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: AppColors.textSecondary,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Save card checkbox
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: _saveCard,
                              onChanged: (val) {
                                setState(() {
                                  _saveCard = val ?? false;
                                });
                              },
                              activeColor: AppColors.primaryRed,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Save card details for future payments',
                            style: AppTextStyles.bodyText,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom - Total + Pay Now
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total price', style: AppTextStyles.bodyText),
                      Text(
                        '\$18.19',
                        style: AppTextStyles.priceLarge,
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 18),
                      decoration: BoxDecoration(
                        color: AppColors.darkBrown,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'Pay Now',
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
