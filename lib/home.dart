import 'package:flutter/material.dart';
import 'package:fooderlich_v2/screens/explore_screen.dart';
import 'package:fooderlich_v2/screens/recipes_screen.dart';
import 'screens/grocery_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  static List<Widget> pages = <Widget>[
    const ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager,
        child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Fooderlich',
              style: Theme.of(context).textTheme.headline6),
          centerTitle: true,
        ),
        body: IndexedStack(index: tabManager.selectedTab, children:
        pages),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context)
              .textSelectionTheme.selectionColor,
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goToTab(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.explore), label: 'Explore',),
            BottomNavigationBarItem(
              icon: Icon(Icons.book), label: 'Recipes',),
            BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'To Buy',),
          ],),);
    },);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Fooderlich',
    //       style: Theme.of(context).textTheme.headline6),
    //     centerTitle: true,
    //   ),
    //   body: pages[_selectedIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
    //     currentIndex: _selectedIndex,
    //     onTap: _onItemTapped,
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.explore),
    //         label: 'Explore',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.book),
    //         label: 'Recipes',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.list),
    //         label: 'To Buy',
    //       ),
    //     ],
    //   ),
    // );
  }
}
