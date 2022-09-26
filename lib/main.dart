import 'package:flutter/material.dart';
//- Screens
import 'package:flutter_nasa_images/screens/screens.dart';
//- Theme
import 'package:flutter_nasa_images/themes/custom_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nasa Images',
      theme: CustomTheme.customTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => const LandingScreen(),
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}
