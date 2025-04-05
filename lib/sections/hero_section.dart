import 'package:flutter/material.dart';

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
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
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
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
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
                    fontSize: 16,
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blue.shade100, width: 20),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/steve.jpeg',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(top: 20, left: 20, child: _buildCircleIcon('assets/icon1.png')),
        Positioned(bottom: 30, right: 20, child: _buildCircleIcon('assets/icon2.jpeg')),
        Positioned(bottom: 10, left: 5, child: _buildEmployeeInfoCard()),
      ],
    );
  }

  Widget _buildCircleIcon(String assetPath) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(assetPath),
    );
  }

  Widget _buildEmployeeInfoCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 2, blurRadius: 5),
        ],
      ),
      child: Row(
        children: [
          ...['user1.jpeg', 'user2.jpeg', 'user3.jpeg'].map(
            (img) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CircleAvatar(radius: 12, backgroundImage: AssetImage('assets/$img')),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('120+ Employees', style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 14),
                  SizedBox(width: 4),
                  Text('5.0 (3.1K Reviews)', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}