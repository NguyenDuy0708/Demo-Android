import 'package:demo2/screens/restaurant_page.dart';
import 'package:flutter/material.dart';
import '../model/restaurant.dart';

class RestaurantLandscapeCard extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantLandscapeCard({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantLandscapeCard> createState() => _RestaurantLandscapeCardState();
}

class _RestaurantLandscapeCardState extends State<RestaurantLandscapeCard> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(8.0)
            ),
            child: AspectRatio(
                aspectRatio: 2.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.restaurant.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(
                          _isFavorited ? Icons.favorite : Icons.favorite_border,
                          color: Colors.red[400],
                        ),
                        onPressed: () {
                          setState(() {
                            _isFavorited = !_isFavorited;
                          });
                        },
                      ),
                    ),
                  ],
                )
            ),
          ),
          ListTile(
            title: Text(
              widget.restaurant.name,
              style: textTheme.titleSmall,
            ),
            subtitle: Text(
              widget.restaurant.description,
              maxLines: 1,
              style: textTheme.bodySmall,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RestaurantPage(restaurant: widget.restaurant))
              );
            },
          )
        ],
      )
    );
  }
}