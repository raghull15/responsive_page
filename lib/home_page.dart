import 'package:flutter/material.dart';
import 'sections/header.dart';
import 'sections/hero_section.dart';
import 'sections/trusted_by_section.dart';
import 'sections/our_work_section.dart';
import 'sections/testimonials_section.dart';
import 'sections/help_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            HeroSection(),
            TrustedBySection(),
            OurWorkSection(),
            TestimonialsSection(),
            HelpSection (),
          ],
        ),
      ),
    );
  }
}
