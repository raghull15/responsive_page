import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Header extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const Header({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Power & Co',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (!isMobile)
                Row(
                  children: [
                    _navButton('About Us'),
                    _navButton('Services'),
                    _navButton('Work'),
                    _navButton('Blog'),
                    _navButton('Contact'),
                  ],
                )
              else
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _navButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextButton(
        onPressed: () {
        },
        child: Text(label),
      ),
    );
  }
}
