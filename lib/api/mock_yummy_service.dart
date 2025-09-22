// lib/api/mock_yummy_service.dart
import '../model/restaurant.dart';
import '../model/food_category.dart';
import '../model/post.dart';
class ExploreData {
  final List<Restaurant> restaurants;
  final List<FoodCategory> categories;
  final List<Post> posts;

  ExploreData({
    required this.restaurants,
    required this.categories,
    required this.posts,
  });
}

class MockYummyService {
  Future<ExploreData> getExploreData() async {
    await Future.delayed(const Duration(seconds: 1));

    final List<Restaurant> mockRestaurants = restaurants;
    final List<FoodCategory> mockCategories = categories;
    final List<Post> mockPosts = posts;


    return ExploreData(
      restaurants: mockRestaurants,
      categories: mockCategories,
      posts: mockPosts,
    );
  }
}


