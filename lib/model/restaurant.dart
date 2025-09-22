class Restaurant {
  const Restaurant({
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  final String name;
  final String imageUrl;
  final String description;
}

final List<Restaurant> restaurants = [
  Restaurant(
    name: 'La Bella Italia',
    imageUrl: 'assets/restaurants/restaurant4.jpg',
    description: 'Authentic Italian cuisine with a modern twist.',
  ),
  Restaurant(
    name: 'Dragon Palace',
    imageUrl: 'assets/restaurants/restaurant2.jpg',
    description: 'Experience the flavors of traditional Chinese dishes.',
  ),
  Restaurant(
    name: 'El Sombrero',
    imageUrl: 'assets/restaurants/restaurant3.jpg',
    description: 'A vibrant atmosphere with delicious Mexican food.',
  ),
  Restaurant(
    name: 'Curry House',
    imageUrl: 'assets/restaurants/restaurant1.jpg',
    description: 'Spicy and flavorful Indian dishes made to perfection.',
  ),
  Restaurant(
    name: 'Le Gourmet',
    imageUrl: 'assets/restaurants/restaurant5.jpg',
    description: 'Fine French dining with an exquisite menu.',
  ),
  Restaurant(
    name: 'Pho Real',
    imageUrl: 'assets/restaurants/restaurant6.jpg',
    description: 'Delicious Vietnamese pho and other traditional dishes.',
  ),
];