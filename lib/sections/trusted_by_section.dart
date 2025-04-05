import 'dart:async';
import 'package:flutter/material.dart';

class TrustedBySection extends StatefulWidget {
  @override
  _TrustedBySectionState createState() => _TrustedBySectionState();
}

class _TrustedBySectionState extends State<TrustedBySection> {
  late ScrollController _scrollController;
  late Timer _scrollTimer;
  final double _scrollSpeed = 50;
  final double _logoHeight = 30.0;
  final double _spacing = 40.0;
  final List<String> _logoPaths = [
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
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() {
    _scrollTimer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double current = _scrollController.position.pixels;
        double next = current + _scrollSpeed;

        if (next >= maxScroll) {
          _scrollController.jumpTo(0.0);
        } else {
          _scrollController.animateTo(next,
              duration: Duration(milliseconds: 150), curve: Curves.linear);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollTimer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          Text('Trusted By Greatest Companies', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          SizedBox(height: 100),
          SizedBox(
            height: 47,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final logo = _logoPaths[index % _logoPaths.length];
                return Padding(
                  padding: EdgeInsets.only(right: _spacing),
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
