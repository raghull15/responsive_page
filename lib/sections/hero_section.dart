import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          final isMobile = sizingInformation.isMobile;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile)
                Row(
                  children: [
                    Expanded(child: _buildTextContent()),
                    const SizedBox(width: 32),
                    Expanded(child: _buildHeroImage(sizingInformation)),
                  ],
                )
              else
                Column(
                  children: [
                    _buildHeroImage(sizingInformation),
                    const SizedBox(height: 32),
                    _buildTextContent(),
                  ],
                ),
            ],
          );
        },
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
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
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
        Wrap(
          spacing: 16,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 26,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
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
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroImage(SizingInformation sizingInformation) {
    double imageSize = 250;
    double borderSize = 20;
    double iconRadius = 20;
    double stackSize = 320;

    if (sizingInformation.isMobile) {
      imageSize = 160;
      borderSize = 10;
      iconRadius = 14;
      stackSize = 220;
    } else if (sizingInformation.isTablet) {
      imageSize = 200;
      borderSize = 15;
      iconRadius = 18;
      stackSize = 270;
    }

    return SizedBox(
      width: stackSize,
      height: stackSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.blue.shade100,
                width: borderSize,
              ),
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
            left: 30,
            child: _buildCircleIcon('assets/icon1.png', iconRadius),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: _buildCircleIcon('assets/icon2.jpeg', iconRadius),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: _buildEmployeeInfoCard(sizingInformation),
          ),
        ],
      ),
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
    double avatarRadius = 14;
    double fontSizePrimary = 14;
    double fontSizeSecondary = 12;
    double iconSize = 16;

    if (sizingInformation.isMobile) {
      avatarRadius = 10;
      fontSizePrimary = 12;
      fontSizeSecondary = 10;
      iconSize = 12;
    } else if (sizingInformation.isTablet) {
      avatarRadius = 12;
      fontSizePrimary = 13;
      fontSizeSecondary = 11;
      iconSize = 14;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children:
                ['user1.jpeg', 'user2.jpeg', 'user3.jpeg'].map((img) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: CircleAvatar(
                      radius: avatarRadius,
                      backgroundImage: AssetImage('assets/$img'),
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '120+ Employees',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSizePrimary,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: iconSize),
                  const SizedBox(width: 4),
                  Text(
                    '5.0 (3.1K Reviews)',
                    style: TextStyle(
                      fontSize: fontSizeSecondary,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
