import 'package:flutter/material.dart';
import 'package:my_recipe/profile/profile.dart';

import 'favourites/favourites.dart';
import 'home/home.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.search),
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            children: const [Home(), Favourites(), Profile()],
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.primary,
            onTap: (value) {
              setState(() {
                currentIndex = value;
                pageController.animateToPage(value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease);
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: "Favourites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: "Profile"),
            ],
            currentIndex: currentIndex,
          )),
    );
  }
}
