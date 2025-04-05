import 'package:flutter/material.dart';

class HelpSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Help Section
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 140),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 800;

              final helpHeader = Column(
                crossAxisAlignment:
                    isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: [
                  Text(
                    'How We Can Help You',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F3651),
                        ),
                    textAlign: isWide ? TextAlign.start : TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Follow our newsletter. We will regularly update\nour latest projects and availability.',
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    textAlign: isWide ? TextAlign.start : TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  emailForm(isWide),
                ],
              );

              final servicesGrid = Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: [
                  serviceTile(Icons.grid_view_rounded, 'UI/UX Design'),
                  serviceTile(Icons.brush_outlined, 'Logo Branding'),
                  serviceTile(Icons.phone_iphone_outlined, 'App Design'),
                  serviceTile(Icons.web_outlined, 'Website Design'),
                ],
              );

              return isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 1, child: helpHeader),
                        SizedBox(width: 48),
                        Expanded(flex: 1, child: Center(child: servicesGrid)),
                      ],
                    )
                  : Column(
                      children: [
                        helpHeader,
                        SizedBox(height: 48),
                        servicesGrid,
                      ],
                    );
            },
          ),
        ),

        // Footer
        Container(
          color: Color(0xFF2F3651),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Power.',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      footerSocialIcon(Icons.youtube_searched_for),
                      footerSocialIcon(Icons.facebook),
                      footerSocialIcon(Icons.alternate_email),
                      footerSocialIcon(Icons.code),
                      footerSocialIcon(Icons.camera_alt_outlined),
                    ],
                  )
                ],
              ),
              Divider(color: Colors.white24, height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 600;
                  return isWide
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [footerLinksColumn(), contactButton()],
                        )
                      : Column(
                          children: [
                            footerLinksColumn(),
                            SizedBox(height: 16),
                            contactButton(),
                          ],
                        );
                },
              ),
              SizedBox(height: 32),
              Text(
                '© power 2021 – All Rights Reserved',
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget emailForm(bool isWide) {
    final emailInput = Container(
      width: 300,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.email_outlined, color: Colors.grey),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email address',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );

    final subscribeButton = Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF9288F8), Color(0xFF7F6AFF)],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0x337F6AFF),
            offset: Offset(0, 6),
            blurRadius: 16,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Subscribe',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );

    return isWide
        ? Row(children: [emailInput, SizedBox(width: 16), subscribeButton])
        : Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [emailInput, subscribeButton],
          );
  }

  Widget serviceTile(IconData icon, String title) {
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(26),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(16),
            ),  
            child: Icon(icon, size: 26, color: Color(0xFF7F6AFF)),
          ),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 6),
          Text(
            'Sometimes features require a short description',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget footerSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Color(0xFF7F6AFF),
        child: Icon(icon, size: 26, color: Colors.white),
      ),
    );
  }

  Widget footerLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: TextStyle(color: Colors.grey[300]),),
    );
  }

 Widget footerLinksColumn() {
  final links = [
    'About Us',
    'Press',
    'Investors',
    'Events',
    'Terms of use',
    'Privacy policy',
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Company',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 24,
          children: links.map((title) => footerLink(title)).toList(),
        ),
      ],
    ),
  );
}


  Widget contactButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF7F6AFF),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text('Contact Us',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
    );
  }
}
