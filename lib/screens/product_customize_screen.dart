import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/product.dart';
import '../widgets/spicy_slider.dart';
import '../widgets/portion_selector.dart';
import '../widgets/topping_item.dart';
import 'payment_screen.dart';

class ProductCustomizeScreen extends StatefulWidget {
  final Product product;

  const ProductCustomizeScreen({super.key, required this.product});

  @override
  State<ProductCustomizeScreen> createState() => _ProductCustomizeScreenState();
}

class _ProductCustomizeScreenState extends State<ProductCustomizeScreen> {
  double _spicyLevel = 0.6;
  int _quantity = 2;

  final List<Map<String, String>> _toppings = [
    {'name': 'Tomato', 'image': 'assets/images/toppings/tomato.png'},
    {'name': 'Onions', 'image': 'assets/images/toppings/onions.png'},
    {'name': 'Pickles', 'image': 'assets/images/toppings/pickles.png'},
    {'name': 'Bacons', 'image': 'assets/images/toppings/bacon.png'},
  ];

  final List<Map<String, String>> _sideOptions = [
    {'name': 'Fries', 'image': 'assets/images/sides/fries.png'},
    {'name': 'Coleslaw', 'image': 'assets/images/sides/coleslaw.png'},
    {'name': 'Salad', 'image': 'assets/images/sides/salad.png'},
    {'name': 'Onion', 'image': 'assets/images/sides/onion_rings.png'},
  ];

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back,
                              color: AppColors.textPrimary,
                              size: 26,
                            ),
                          ),
                          const Icon(
                            Icons.search,
                            color: AppColors.textPrimary,
                            size: 26,
                          ),
                        ],
                      ),
                    ),

                    // Burger image + title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Burger image
                          Image.asset(
                            'assets/images/burgers/custom_burger.png',
                            width: 160,
                            height: 180,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 16),
                          // Title text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  'Customize',
                                  style: AppTextStyles.sectionTitle.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Your Burger to Your Tastes. Ultimate Experience',
                                  style: AppTextStyles.bodyText,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Spicy slider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SpicySlider(
                        value: _spicyLevel,
                        onChanged: (val) {
                          setState(() {
                            _spicyLevel = val;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Portion
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: PortionSelector(
                        quantity: _quantity,
                        onIncrement: () {
                          setState(() {
                            _quantity++;
                          });
                        },
                        onDecrement: () {
                          if (_quantity > 1) {
                            setState(() {
                              _quantity--;
                            });
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Toppings
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Toppings',
                        style: AppTextStyles.sectionTitle,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 95,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: _toppings.length,
                        separatorBuilder: (context, i) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return ToppingItem(
                            name: _toppings[index]['name']!,
                            imagePath: _toppings[index]['image']!,
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Side options
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Side options',
                        style: AppTextStyles.sectionTitle,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 95,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: _sideOptions.length,
                        separatorBuilder: (context, i) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return ToppingItem(
                            name: _sideOptions[index]['name']!,
                            imagePath: _sideOptions[index]['image']!,
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Bottom - Total + ORDER NOW
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: AppTextStyles.bodyText,
                      ),
                      Text(
                        '\$16.49',
                        style: AppTextStyles.priceLarge.copyWith(fontSize: 26),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 18),
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        'ORDER NOW',
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
