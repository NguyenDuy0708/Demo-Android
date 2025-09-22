import 'package:demo2/components/post_card.dart';
import 'package:demo2/components/restaurant_landscape_card.dart';
import 'package:demo2/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'components/theme_button.dart';
import 'components/color_button.dart';
import 'constants.dart';
import 'components/category_card.dart';
import 'model/food_category.dart';
import 'components/post_card.dart';
import 'model/post.dart';
import 'screens/explore_page.dart';
class Home extends StatefulWidget{
  const Home ({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
  });
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home>{
  int tab = 0;
  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.home),
      selectedIcon: Icon(Icons.home),
      label: 'Explore',
    ),
    NavigationDestination(
      icon: Icon(Icons.menu),
      selectedIcon: Icon(Icons.menu),
      label: 'Orders',
    ),
    NavigationDestination(
      icon: Icon(Icons.manage_accounts_outlined),
      selectedIcon: Icon(Icons.manage_accounts_outlined),
      label: 'Account',
    ),
  ];
  @override
  Widget build(BuildContext context){
    final pages = [
      ExplorePage(),
      Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: PostCard(post: posts[0],),
        ),
      ),
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: RestaurantLandscapeCard(restaurant: restaurants[0]),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          ThemeButton(changeThemeMode: widget.changeTheme,),
          ColorButton(colorSelected: widget.colorSelected, changeColor: widget.changeColor),
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        destinations: appBarDestinations,
      ),
    );
  }
}