import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(child: _buildTextContent()),
          const SizedBox(width: 32),
          Expanded(child: _buildHeroImage()),
        ],
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
            children: [
              TextSpan(text: 'We Design Impactful\n'),
              TextSpan(text: 'Digital ', style: TextStyle(color: Colors.blue)),
              TextSpan(text: 'Products'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Help find solutions with intuitive end in accordance with client business goals. We provide a high-quality service.',
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
              ),
              child: const Text(
                'Contact Us',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            const SizedBox(width: 16),
            Row(
              children: const [
                Icon(Icons.play_circle_outline, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Watch Video',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroImage() {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double imageSize = 250;
        double borderSize = 20;
        double iconRadius = 20;

        if (sizingInformation.isMobile) {
          imageSize = 150;
          borderSize = 10;
          iconRadius = 15;
        } else if (sizingInformation.isTablet) {
          imageSize = 200;
          borderSize = 15;
          iconRadius = 18;
        }

        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue.shade100, width: borderSize),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/steve.jpeg',
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 10,
                left: 40,
                child: _buildCircleIcon('assets/icon1.png', iconRadius)),
            Positioned(
                bottom: 20,
                right: 40,
                child: _buildCircleIcon('assets/icon2.jpeg', iconRadius)),
            Positioned(bottom: 10, left: 5, child: _buildEmployeeInfoCard(sizingInformation)),
          ],
        );
      },
    );
  }

  Widget _buildCircleIcon(String assetPath, double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(assetPath),
    );
  }

  Widget _buildEmployeeInfoCard(SizingInformation sizingInformation) {
    double avatarRadius = 12;
    double fontSizePrimary = 14;
    double fontSizeSecondary = 12;
    double iconSize = 14;

    if (sizingInformation.isMobile) {
      avatarRadius = 10;
      fontSizePrimary = 12;
      fontSizeSecondary = 10;
      iconSize = 12;
    } else if (sizingInformation.isTablet) {
      avatarRadius = 11;
      fontSizePrimary = 13;
      fontSizeSecondary = 11;
      iconSize = 13;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          ...['user1.jpeg', 'user2.jpeg', 'user3.jpeg'].map(
            (img) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CircleAvatar(
                  radius: avatarRadius, backgroundImage: AssetImage('assets/$img')),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('120+ Employees',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSizePrimary)),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: iconSize),
                  const SizedBox(width: 4),
                  Text('5.0 (3.1K Reviews)', style: TextStyle(fontSize: fontSizeSecondary)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}