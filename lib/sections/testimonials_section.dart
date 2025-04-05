import 'package:flutter/material.dart';

class TestimonialsSection extends StatefulWidget {
  @override
  _TestimonialsSectionState createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  int activeIndex = 2;

  final List<Map<String, String>> users = [
    {'image': 'assets/user1.jpeg', 'name': 'Sarah Joe', 'title': 'CEO at BetaX'},
    {'image': 'assets/user2.jpeg', 'name': 'Mike Louis', 'title': 'Designer at Crea'},
    {'image': 'assets/user3.jpeg', 'name': 'Ricky Aprilia', 'title': 'Founder of Varibo'},
    {'image': 'assets/user4.jpeg', 'name': 'Daniel Ray', 'title': 'Dev at Nimbus'},
    {'image': 'assets/user5.jpeg', 'name': 'Ella Stone', 'title': 'UX at Flowly'},
  ];

  @override
  Widget build(BuildContext context) {
    final activeUser = users[activeIndex];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Let's Hear",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87)),
          SizedBox(height: 8),
          Text("What They Says",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87)),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.format_quote, color: Colors.purple, size: 32),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Risus vel lobortis tincidunt fames quisque mauris at diam. "
                    "Nullam morbi ipsum turpis amet id posuere tortor quis nostrud "
                    "ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ),
                SizedBox(width: 16),
                Icon(Icons.format_quote, color: Colors.purple, size: 32),
              ],
            ),
          ),
          SizedBox(height: 32),

          // Avatar Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(users.length, (index) {
              final user = users[index];
              final isActive = index == activeIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    padding: isActive ? EdgeInsets.all(2) : EdgeInsets.zero,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: isActive
                          ? Border.all(color: Colors.purple, width: 2)
                          : null,
                    ),
                    child: ClipOval(
                      child: Container(
                        width: 64,
                        height: 64,
                        child: Image.asset(
                          user['image']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          SizedBox(height: 24),
          Text(activeUser['name']!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
          Text(activeUser['title']!,
              style: TextStyle(color: Colors.grey[600], fontSize: 14)),
        ],
      ),
    );
  }
}
