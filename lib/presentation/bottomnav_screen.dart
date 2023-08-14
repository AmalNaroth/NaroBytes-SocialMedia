import 'package:flutter/material.dart';
import 'package:narobytes_secondproject/presentation/home_screen.dart';
import 'package:narobytes_secondproject/presentation/search_screen.dart';
import 'package:narobytes_secondproject/provider/bottomnav_screen.dart';
import 'package:provider/provider.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});

  List<Widget> screens = [const HomeScreen(), const SearchScreen()];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = context.watch<BottomNavProvider>();
    return Scaffold(
      body: screens[bottomNavProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavProvider.currentIndex,
          onTap: (value) {
            bottomNavProvider.currentIndexChange = value;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search")
          ]),
    );
  }
}
