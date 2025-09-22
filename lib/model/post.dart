class Post {
  final String title;
  final String imageUrl;
  final DateTime timestamp;

  Post({
    required this.title,
    required this.imageUrl,
    required this.timestamp,
  });
}
final List<Post> posts = [
  Post(
    title: 'Exploring the Best Italian Restaurants in Town',
    imageUrl: 'assets/profile_pics/pic1.jpg',
    timestamp: DateTime(2024, 5, 20, 14, 30),
  ),
  Post(
    title: 'A Culinary Journey Through Chinese Cuisine',
    imageUrl: 'assets/profile_pics/pic2.jpg',
      timestamp: DateTime(2024, 5, 20, 14, 30),
  ),
];
