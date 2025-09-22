import 'package:demo2/components/category_section.dart';
import 'package:demo2/components/post_section.dart';
import 'package:flutter/material.dart';
import '../api/mock_yummy_service.dart';
import '../components/restaurant_section.dart';
import '../components/restaurant_landscape_card.dart';
import '../components/category_section.dart';
class ExplorePage extends StatelessWidget{
  final mockYummyService = MockYummyService();
  ExplorePage ({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mockYummyService.getExploreData(),
        builder:(context, AsyncSnapshot<ExploreData> snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.posts ?? [];
          return ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              RestaurantSection(restaurants: restaurants),
              CategorySection(categories: categories),
              PostSection(posts: posts),
            ],
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}