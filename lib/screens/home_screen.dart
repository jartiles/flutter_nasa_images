import 'package:flutter/material.dart';
//- Provider
import 'package:provider/provider.dart';
import 'package:flutter_nasa_images/services/navigation_services.dart';
import 'package:flutter_nasa_images/services/nasa_services.dart';
//- Screens
import 'package:flutter_nasa_images/screens/screens.dart';
//- Widgets
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationServices()),
        ChangeNotifierProvider(create: (context) => NasaServices()),
      ],
      child: const Scaffold(
        body: ApodScreen(),
      ),
    );
  }
}

class _Screens extends StatelessWidget {
  const _Screens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationService = Provider.of<NavigationServices>(context);
    return PageView(
      controller: navigationService.getPageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const ApodScreen(),
        Container(color: Colors.green),
      ],
    );
  }
}
