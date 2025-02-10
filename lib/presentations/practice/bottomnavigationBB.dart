import 'package:contact_dairy_app/presentations/practice/home.dart';
import 'package:contact_dairy_app/presentations/practice/pageview.dart';
import 'package:contact_dairy_app/presentations/practice/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBNB extends StatefulWidget {
  HomeBNB({super.key});

  @override
  State<HomeBNB> createState() => _HomeBNBState();
}

class _HomeBNBState extends State<HomeBNB> {
  List<Widget> pages = [
    const HomePAge(),
    const PageviewPage(),
  ];

  @override
  Widget build(BuildContext context) {
    ProviderPlatform pageProviderR =
        Provider.of<ProviderPlatform>(context, listen: true);
    ProviderPlatform pageProviderW =
        Provider.of<ProviderPlatform>(context, listen: false);
    return Scaffold(
      body: PageView(
        controller: pageProviderW.pageController,
        onPageChanged: (index) {
          pageProviderR.setPage(index);
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageProviderW.selectedPageIndex,
        onTap: (index) {
          pageProviderR.setPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_outlined),
            label: "Reels",
          ),
        ],
      ),
    );
  }
}
