import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Power & Co', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
          Row(
            children: [
              _navButton('About Us'),
              _navButton('Services'),
              _navButton('Work'),
              _navButton('Blog'),
              _navButton('Contact'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(onPressed: () {}, child: Text(label)),
    );
  }
}
