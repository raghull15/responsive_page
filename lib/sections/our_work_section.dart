import 'package:flutter/material.dart';

class OurWorkSection extends StatelessWidget {
  const OurWorkSection({super.key});

  final double _itemWidth = 300;
  final double _imageHeight = 180;
  final double _cardPadding = 16;

  @override
  Widget build(BuildContext context) {
    final List<_WorkItem> workItems = const [
      _WorkItem(
        title: 'App Redesign',
        image: 'assets/app_redesign.jpeg',
        description:
            "A modern revamp focusing on improved user experience, clean visuals, intuitive navigation, and optimized performance across devices.",
      ),
      _WorkItem(
        title: 'Redesign ECommerce Website',
        image: 'assets/ecommerce_redesign.jpeg',
        description:
            "Redesigned with a sleek UI, faster checkout, mobile-first experience, and personalized product discovery to boost conversions and user engagement.",
      ),
      _WorkItem(
        title: 'NexaCenter App for Property',
        image: 'assets/nexa_center_app.jpeg',
        description:
            "NexaCenter is a smart property management app designed to simplify listings, streamline tenant interactions, and provide real-time insights for owners and agents.",
      ),
      _WorkItem(
        title: 'Social Media App Platform',
        image: 'assets/social_media_app.jpeg',
        description:
            "A dynamic platform to connect, share, and engage with a community through posts, stories, and real-time interactions.",
      ),
      _WorkItem(
        title: 'Calendar App for Big SaaS Company',
        image: 'assets/calendar_app.jpeg',
        description:
            'Makes the day bleshing and wonderful through the good dates and good vibes.',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'We Create World-Class Digital Products',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'By information-driven design, the world is the best instruction, media, helping by information.',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: workItems.map((item) => _buildWorkCard(item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkCard(_WorkItem item) {
    return Container(
      width: _itemWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              item.image,
              height: _imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.description,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkItem {
  final String title;
  final String image;
  final String description;

  const _WorkItem({
    required this.title,
    required this.image,
    required this.description,
  });
}
