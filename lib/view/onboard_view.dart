import 'package:flutter/material.dart';

import 'home_view.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          backgroundImage(),
          backgroundGradientEffect(),
          onboardTexts(),
          getStartedButton(context),
        ],
      ),
    );
  }

  Positioned getStartedButton(BuildContext context) {
    return Positioned(
      left: 30,
      right: 30,
      bottom: 8,
      child: SizedBox(
        height: 62,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFC67C4E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomeView(),
            ));
          },
          child: Text('Get Started'),
        ),
      ),
    );
  }

  Positioned onboardTexts() {
    return Positioned(
      left: 30,
      right: 30,
      bottom: 147,
      child: Column(
        children: [
          Text(
            'Coffee so good, your taste buds will love it.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'The best grain, the finest roast, the powerful flavor.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Positioned backgroundGradientEffect() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black,
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
      ),
    );
  }

  Positioned backgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        'assets/fashion_image.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
