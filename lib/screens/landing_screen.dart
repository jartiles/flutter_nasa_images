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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LandingBackground(),
              const Text(
                'Conoce el universo con las imagenes de la NASA.',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/home'),
                  child: const Text('Exploremos'))
            ],
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
