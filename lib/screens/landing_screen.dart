import 'package:flutter/material.dart';
//- Widgets
import '../widgets/landing_background.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: _decorationGradient(),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: const [LandingBackground(), _TitleAndActions()],
          ),
        ),
      ),
    );
  }

  BoxDecoration _decorationGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xff01112d),
        Color(0xff00244f),
        Color(0xff003e75),
      ], begin: Alignment.topCenter),
    );
  }
}

class _TitleAndActions extends StatelessWidget {
  const _TitleAndActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Get to know the universe with NASA images.',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
            child: const Text('Let\'s explore'),
          )
        ],
      ),
    );
  }
}
