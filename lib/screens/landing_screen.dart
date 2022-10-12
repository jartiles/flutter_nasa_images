import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//- Widgets
import '../widgets/landing_background.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri url = Uri.parse(
      'https://www.freepik.es/vector-gratis/fondo-dibujado-colorido-espacio_4792328.htm#query=space&position=3&from_view=search',
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: _decorationGradient(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LandingBackground(),
                TextButton(
                  onPressed: () async {
                    if (!await canLaunchUrl(url)) return;
                    await launchUrl(url);
                  },
                  child: const Text('Imagen de pikisuperstar en Freepik'),
                ),
                const Text(
                  'Conoce el universo con las imagenes de la NASA.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/home'),
                  child: const Text('Exploremos'),
                )
              ],
            ),
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
