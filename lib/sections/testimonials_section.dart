import 'package:flutter/material.dart';

class TestimonialsSection extends StatefulWidget {
  @override
  _TestimonialsSectionState createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int activeIndex = 2;

  final List<Map<String, String>> users = [
    {'image': 'assets/user1.jpeg', 'name': 'Sakthi', 'title': 'CEO at Gogle'},
    {'image': 'assets/user2.jpeg', 'name': 'Chivaraam', 'title': 'Amazin'},
    {
      'image': 'assets/user3.jpeg',
      'name': 'Jhalesh',
      'title': 'Founder of Macrosoft',
    },
    {
      'image': 'assets/user4.jpeg',
      'name': 'Saravannan',
      'title': 'Dev at Cart',
    },
    {'image': 'assets/user5.jpeg', 'name': 'Suriya', 'title': 'UX Tigma'},
  ];

  @override
  Widget build(BuildContext context) {
    final activeUser = users[activeIndex];
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Let's Hear",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "What They Says",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth < 600 ? 16 : 48,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.format_quote, color: Colors.purple, size: 32),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "Pain itself, it is important to be free from, but pursued by some, is a part of the elite way of living. "
                  "Laughter or craving for refined balance—every individual at the peak. "
                  "No sadness or pain, only proper posture and effort for the comfort of ease. "
                  "Pain is felt in the experience of pleasure when being blamed or criticized.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.format_quote, color: Colors.purple, size: 32),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildAvatarRow(),
          const SizedBox(height: 24),
          Text(
            activeUser['name']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          Text(
            activeUser['title']!,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarRow() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: List.generate(users.length, (index) {
        final user = users[index];
        final isActive = index == activeIndex;

        return GestureDetector(
          onTap: () {
            setState(() => activeIndex = index);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: isActive ? const EdgeInsets.all(2) : EdgeInsets.zero,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border:
                  isActive ? Border.all(color: Colors.purple, width: 2) : null,
            ),
            child: ClipOval(
              child: Image.asset(
                user['image']!,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }),
    );
  }
}
