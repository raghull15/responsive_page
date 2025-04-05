import 'dart:async';
import 'package:flutter/material.dart';

class TrustedBySection extends StatefulWidget {
  const TrustedBySection({super.key});

  @override
  State<TrustedBySection> createState() => _TrustedBySectionState();
}

class _TrustedBySectionState extends State<TrustedBySection> {
  late final ScrollController _scrollController;
  Timer? _scrollTimer;

  static const double _scrollSpeed = 50; // pixels per cycle
  static const double _logoHeight = 30;
  static const double _spacing = 40;

  final List<String> _logoPaths = const [
    'assets/google.png',
    'assets/airbnb.png',
    'assets/creative.jpeg',
    'assets/shopify.png',
    'assets/amazon.png',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startAutoScroll());
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (!_scrollController.hasClients) return;

      final double maxScroll = _scrollController.position.maxScrollExtent;
      final double current = _scrollController.offset;
      final double next = current + _scrollSpeed;

      if (next >= maxScroll) {
        _scrollController.jumpTo(0);
      } else {
        _scrollController.animateTo(
          next,
          duration: const Duration(milliseconds: 150),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          Text(
            'Trusted By Greatest Companies',
            style: TextStyle(fontSize: 26, color: Colors.grey[600]),
          ),
          const SizedBox(height: 100),
          SizedBox(
            height: 47,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final logo = _logoPaths[index % _logoPaths.length];
                return Padding(
                  padding: const EdgeInsets.only(right: _spacing),
                  child: Image.asset(logo, height: _logoHeight),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
