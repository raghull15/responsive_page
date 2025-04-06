import 'package:flutter/material.dart';
import 'sections/header.dart';
import 'sections/hero_section.dart';
import 'sections/trusted_by_section.dart';
import 'sections/our_work_section.dart';
import 'sections/testimonials_section.dart';
import 'sections/help_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: const Color(0xFF7F6AFF)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ListTile(title: Text('About Us'), onTap: () {}),
            ListTile(title: Text('Services'), onTap: () {}),
            ListTile(title: Text('Work'), onTap: () {}),
            ListTile(title: Text('Blog'), onTap: () {}),
            ListTile(title: Text('Contact'), onTap: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(scaffoldKey: _scaffoldKey),
            HeroSection(),
            TrustedBySection(),
            OurWorkSection(),
            TestimonialsSection(),
            HelpSection(),
          ],
        ),
      ),
    );
  }
}
