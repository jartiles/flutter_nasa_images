import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/navigation_services.dart';

class CustomBottomNavigator extends StatelessWidget {
  const CustomBottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationService = Provider.of<NavigationServices>(context);
    return BottomNavigationBar(
      currentIndex: navigationService.getActualPage,
      onTap: (value) => navigationService.setActualPage = value,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.abc),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          label: '',
        )
      ],
    );
  }
}
