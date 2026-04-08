import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/chat_bubble.dart';

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                    Icons.more_horiz,
                    color: AppColors.textPrimary,
                    size: 26,
                  ),
                ],
              ),
            ),

            // Chat messages
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  ChatBubble(
                    message: 'Hi, how can I help you?',
                    isUser: false,
                  ),
                  ChatBubble(
                    message:
                        'Hello, I ordered two fried chicken burgers. can I know how much time it will get to arrive?',
                    isUser: true,
                  ),
                  ChatBubble(
                    message: 'Ok, please let me check!',
                    isUser: false,
                  ),
                  ChatBubble(
                    message: 'Sure...',
                    isUser: true,
                  ),
                  ChatBubble(
                    message:
                        "It'll get 25 minutes to arrive to your address",
                    isUser: false,
                    timestamp: '26 minutes ago',
                  ),
                  ChatBubble(
                    message: 'Ok, thanks you for your support',
                    isUser: true,
                  ),
                ],
              ),
            ),

            // Input field
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.searchBarBg,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type here...',
                          hintStyle: AppTextStyles.searchHint,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryRed,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.send,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
