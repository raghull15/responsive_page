import 'package:flutter/material.dart';

class HelpSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                          color: const Color(0xFF2F3651),
                        ),
                    textAlign: isWide ? TextAlign.start : TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Follow our newsletter. We will regularly update\nour latest projects and availability.',
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    textAlign: isWide ? TextAlign.start : TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  _emailForm(isWide),
                ],
              );

              final servicesGrid = Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: [
                  _serviceTile(Icons.grid_view_rounded, 'UI/UX Design'),
                  _serviceTile(Icons.brush_outlined, 'Logo Branding'),
                  _serviceTile(Icons.phone_iphone_outlined, 'App Design'),
                  _serviceTile(Icons.web_outlined, 'Website Design'),
                ],
              );

              return isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: helpHeader),
                        const SizedBox(width: 48),
                        Expanded(child: Center(child: servicesGrid)),
                      ],
                    )
                  : Column(
                      children: [
                        helpHeader,
                        const SizedBox(height: 48),
                        servicesGrid,
                      ],
                    );
            },
          ),
        ),
        _buildFooter(context),
      ],
    );
  }

  Widget _emailForm(bool isWide) {
    final emailInput = Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.email_outlined, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
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
        gradient: const LinearGradient(
          colors: [Color(0xFF9288F8), Color(0xFF7F6AFF)],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x337F6AFF),
            offset: Offset(0, 6),
            blurRadius: 16,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Subscribe',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );

    return isWide
        ? Row(children: [emailInput, const SizedBox(width: 16), subscribeButton])
        : Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 12,
            children: [emailInput, subscribeButton],
          );
  }

  Widget _serviceTile(IconData icon, String title) {
    return SizedBox(
      width: 160,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(26),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F6FA),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, size: 26, color: const Color(0xFF7F6AFF)),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            'Sometimes features require a short description',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600], fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: const Color(0xFF2F3651),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Power & Co',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  _footerSocialIcon(Icons.youtube_searched_for),
                  _footerSocialIcon(Icons.facebook),
                  _footerSocialIcon(Icons.alternate_email),
                  _footerSocialIcon(Icons.code),
                  _footerSocialIcon(Icons.camera_alt_outlined),
                ],
              ),
            ],
          ),
          const Divider(color: Colors.white24, height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 600;
              return isWide
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [_footerLinksColumn(), _contactButton()],
                    )
                  : Column(
                      children: [
                        _footerLinksColumn(),
                        const SizedBox(height: 16),
                        _contactButton(),
                      ],
                    );
            },
          ),
          const SizedBox(height: 32),
          Text(
            '© power & co 2025 – All Rights Reserved',
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _footerSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: CircleAvatar(
        radius: 22,
        backgroundColor: const Color(0xFF7F6AFF),
        child: Icon(icon, size: 26, color: Colors.white),
      ),
    );
  }

  Widget _footerLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: TextStyle(color: Colors.grey[300])),
    );
  }

  Widget _footerLinksColumn() {
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
          const Text(
            'Company',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 24,
            children: links.map((title) => _footerLink(title)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _contactButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7F6AFF),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text(
        'Contact Us',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
