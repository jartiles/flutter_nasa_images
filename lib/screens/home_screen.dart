import 'package:flutter/material.dart';
//- Provider
import 'package:provider/provider.dart';
import 'package:flutter_nasa_images/services/nasa_services.dart';
//- Screens
import 'package:flutter_nasa_images/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NasaServices(),
      child: const Scaffold(body: ApodScreen()),
    );
  }
}
