import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/product.dart';
import '../widgets/spicy_slider.dart';
import '../widgets/portion_selector.dart';
import 'product_customize_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  double _spicyLevel = 0.4;
  int _quantity = 2;

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

                    // Product image
                    Center(
                      child: Image.asset(
                        widget.product.imagePath,
                        height: 250,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Product info
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            '${widget.product.name} ${widget.product.subtitle}',
                            style: AppTextStyles.detailTitle,
                          ),
                          const SizedBox(height: 8),

                          // Rating & delivery time
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.ratingStar,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.product.rating.toString(),
                                style: AppTextStyles.rating,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                '—  ${widget.product.deliveryTime}',
                                style: AppTextStyles.bodyText,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Description
                          Text(
                            widget.product.description,
                            style: AppTextStyles.bodyText,
                          ),
                          const SizedBox(height: 24),

                          // Spicy & Portion row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: SpicySlider(
                                  value: _spicyLevel,
                                  onChanged: (val) {
                                    setState(() {
                                      _spicyLevel = val;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              PortionSelector(
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
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Favorite icon
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.favorite_border,
                              color: AppColors.heartGrey,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom bar - Price + ORDER NOW
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
              child: Row(
                children: [
                  // Price tag
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: AppColors.primaryRed,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style: AppTextStyles.priceTag,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // ORDER NOW button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductCustomizeScreen(
                              product: widget.product,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        decoration: BoxDecoration(
                          color: AppColors.darkBrown,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'ORDER NOW',
                            style: AppTextStyles.buttonText,
                          ),
                        ),
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
