import 'package:demo2/components/item_details.dart';
import 'package:demo2/screens/checkout_page.dart';
import 'package:flutter/material.dart';
import '../model/menu_item.dart';
import '../model/restaurant.dart';
import '../components/restaurant_item.dart';
import '../model/cart_manager.dart';
import '../model/order_manager.dart';
class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantPage({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  final CartManager cartManager = CartManager();
  final OrderManager orderManager = OrderManager();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static const desktopThreshold = 700;

  static const double largeScreenPercentage = 0.9;
  static const double maxWidth = 1000;

  static const double drawerWidth = 375.0;

  void openDrawer(){
    scaffoldKey.currentState!.openEndDrawer();
  }
  double calculateConstrainedWidth(double screenWidth) {
    return (screenWidth > desktopThreshold
        ? screenWidth * largeScreenPercentage : screenWidth).clamp(0.0, maxWidth);
  }
  int calculateColumnCount(double screenWidth) {
    return screenWidth > desktopThreshold ? 2 : 1;
  }
  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(),
        _buildInfoSection(),
        _buildGridViewSection('Menu'),
      ],
    );
  }
  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 64.0,
            ),
            child:Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                      image: AssetImage(widget.restaurant.imageUrl),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  left: 16,
                  child: CircleAvatar(
                    radius: 30.0,
                    child: Icon(Icons.store, color: Colors.white,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildInfoSection() {
    final textTheme = Theme.of(context).textTheme;
    final restaurant = widget.restaurant;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: textTheme.headlineLarge,
            ),
            Text(
              restaurant.description,
              style: textTheme.bodySmall,
            ),
            Text(
              'Rating: ${restaurant.rating} / 5.0',
              style: textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(int index) {
    final item = widget.restaurant.items[index];
    return InkWell(
      onTap: () => _showBottomSheet(item),
      child: RestaurantItem(item: item),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildEndDrawer(){
    return SizedBox(
      width: drawerWidth,

      child: Drawer(
        child: CheckoutPage(
            cartManager: cartManager,
            didUpdate :() {
              setState(() {});
            },
            onSubmit: (order) {
              orderManager.addOrder(order);
              Navigator.popUntil(context, (route) => route.isFirst);
            }
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton(){
    return FloatingActionButton.extended(
        onPressed: openDrawer,
        tooltip: 'Cart',
        icon: const Icon(Icons.shopping_cart),
        label: Text('${cartManager.items.length} Items in cart')
    );
  }

  GridView _buildGridView(int columnCount) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 3.5,
      ),
      itemCount: widget.restaurant.items.length,
      itemBuilder: (context, index) => _buildGridItem(index),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
  SliverToBoxAdapter _buildGridViewSection(String title) {
    final columns = calculateColumnCount(MediaQuery.of(context).size.width);
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all( 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(title),
            _buildGridView(columns),
          ],
        ),
      ),
    );
  }
  void _showBottomSheet(MenuItem item) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      constraints: const BoxConstraints(maxWidth: 480),
      builder: (context) => ItemDetails(
        item: item,
        cartManager: cartManager,
        quantityUpdated: () {
          setState(() {});
        }
      ),
    );
  }

  @override
    Widget build(BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      final constrainedWidth = calculateConstrainedWidth(screenWidth);
      return Scaffold(
        key: scaffoldKey,
        body: Center(
          child: SizedBox(
            width: constrainedWidth,
            child: _buildCustomScrollView(),
          ),
        ),
        endDrawer: _buildEndDrawer(),
        floatingActionButton: _buildFloatingActionButton(),
      );
    }
  }

