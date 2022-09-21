import 'package:flutter/material.dart';
//- Provider
import 'package:provider/provider.dart';
import 'package:flutter_nasa_images/services/navigation_services.dart';
//- Widgets
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationServices(),
      child: const Scaffold(
        body: _Pages(),
        bottomNavigationBar: CustomBottomNavigator(),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationService = Provider.of<NavigationServices>(context);
    return PageView(
      controller: navigationService.getPageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(color: Colors.red),
        Container(color: Colors.green),
      ],
    );
  }
}
