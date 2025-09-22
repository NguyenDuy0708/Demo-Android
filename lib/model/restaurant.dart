import 'package:demo2/model/menu_item.dart';
import 'package:flutter/material.dart';

class Restaurant {
  final String name;
  final String imageUrl;
  final String description;
  final double rating;
  final List<MenuItem> items;

  const Restaurant({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.items,
  });

}

final List<Restaurant> restaurants = [
  Restaurant(
    name: 'La Bella Italia',
    imageUrl: 'assets/restaurants/restaurant4.jpg',
    description: 'Authentic Italian cuisine with a modern twist.',
    rating: 4.5,
    items: [
      MenuItem(name: 'Pizza Margherita',description: 'Have verry Chese', price: 8.5, imageUrl: 'assets/restaurants/menu_item/italy_food1.jpg'),
      MenuItem(name: 'Pasta Carbonara',description: 'Beutifull', price: 10.0, imageUrl: 'assets/restaurants/menu_item/italy_food2.jpg'),
    ],
  ),
  Restaurant(
    name: 'Dragon Palace',
    imageUrl: 'assets/restaurants/restaurant2.jpg',
    description: 'Experience the flavors of traditional Chinese dishes.',
    rating: 4.2,
    items: [
      // MenuItem(name: 'Kung Pao Chicken', price: 9.0, imageUrl: 'assets/items/kungpao.jpg'),
      // MenuItem(name: 'Spring Rolls', price: 5.0, imageUrl: 'assets/items/springrolls.jpg'),
    ],
  ),
  Restaurant(
    name: 'El Sombrero',
    imageUrl: 'assets/restaurants/restaurant3.jpg',
    description: 'A vibrant atmosphere with delicious Mexican food.',
    rating: 4.0,
    items: [
      // MenuItem(name: 'Tacos Al Pastor', price: 7.5, imageUrl: 'assets/items/tacos.jpg'),
      // MenuItem(name: 'Guacamole', price: 4.0, imageUrl: 'assets/items/guacamole.jpg'),
    ],
  ),
  Restaurant(
    name: 'Curry House',
    imageUrl: 'assets/restaurants/restaurant1.jpg',
    description: 'Spicy and flavorful Indian dishes made to perfection.',
    rating: 4.3,
    items: [
      // MenuItem(name: 'Butter Chicken', price: 11.0, imageUrl: 'assets/items/butterchicken.jpg'),
      // MenuItem(name: 'Naan Bread', price: 3.0, imageUrl: 'assets/items/naan.jpg'),
    ],
  ),
  Restaurant(
    name: 'Le Gourmet',
    imageUrl: 'assets/restaurants/restaurant5.jpg',
    description: 'Fine French dining with an exquisite menu.',
    rating: 4.6,
    items: [
      // MenuItem(name: 'Coq au Vin', price: 15.0, imageUrl: 'assets/items/coqauvin.jpg'),
      // MenuItem(name: 'Crème Brûlée', price: 6.0, imageUrl: 'assets/items/cremebrulee.jpg'),
    ],
  ),
  Restaurant(
    name: 'Pho Real',
    imageUrl: 'assets/restaurants/restaurant6.jpg',
    description: 'Delicious Vietnamese pho and other traditional dishes.',
    rating: 4.9,
    items: [
      // MenuItem(name: 'Beef Pho', price: 9.5, imageUrl: 'assets/items/beefpho.jpg'),
      // MenuItem(name: 'Spring Rolls', price: 5.0, imageUrl: 'assets/items/springrolls.jpg'),
    ],
  ),
];