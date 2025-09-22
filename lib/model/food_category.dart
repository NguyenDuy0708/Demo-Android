
class FoodCategory {
  final String id;
  final String name;
  final String image;
  final int numberOfRestaurants;


  const FoodCategory({
    required this.id,
    required this.name,
    required this.image,
    required this.numberOfRestaurants,
  });
}
const List<FoodCategory> categories = [
  FoodCategory(
    id: '1',
    name: 'Italian',
    image: 'assets/food/italian.jpg',
    numberOfRestaurants: 24,
  ),
  FoodCategory(
    id: '2',
    name: 'Chinese',
    image: 'assets/food/chinese.jpg',
    numberOfRestaurants: 17,
  ),
  FoodCategory(
    id: '3',
    name: 'Mexican',
    image: 'assets/food/mexican.jpg',
    numberOfRestaurants: 8,
  ),
  FoodCategory(
    id: '4',
    name: 'Indian',
    image: 'assets/food/indian.jpg',
    numberOfRestaurants: 12,
  ),
  FoodCategory(
    id: '5',
    name: 'French',
    image: 'assets/food/french.jpg',
    numberOfRestaurants: 7,
  ),
  FoodCategory(
      id: '6',
      name: 'Vietnamese',
      image: 'assets/food/vietnamese.jpg',
      numberOfRestaurants: 10,
  )
];
