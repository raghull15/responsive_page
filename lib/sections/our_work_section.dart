import 'package:flutter/material.dart';

class OurWorkSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'We Create World-Class Digital Products',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'By information-driven design, the world is the best instruction, media, helping by information.',
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(height: 24),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildWorkItem(
                title: 'App Redesign',
                image: 'assets/app_redesign.jpeg',
                description: 'Lorem ipsum dolor sit amet.',
              ),
              _buildWorkItem(
                title: 'Redesign ECommerce Website',
                image: 'assets/ecommerce_redesign.jpeg',
                description: 'Sed do eiusmod tempor.',
              ),
              _buildWorkItem(
                title: 'NexaCenter App for Property',
                image: 'assets/nexa_center_app.jpeg',
                description: 'Ut enim ad minim veniam.',
              ),
              _buildWorkItem(
                title: 'Social Media App Platform',
                image: 'assets/social_media_app.jpeg',
                description: 'Duis aute irure dolor.',
              ),
              _buildWorkItem(
                title: 'Calendar App for Big SaaS Company',
                image: 'assets/calendar_app.jpeg',
                description: 'Excepteur sint occaecat.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkItem({
    required String title,
    required String image,
    required String description,
  }) {
    return Container(
      width: 300,
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
