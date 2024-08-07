import 'package:flutter/material.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget{

  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availableMeals,
  });

  final void Function (Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category){
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    ///Navigator.push(context, route)
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
              onToggleFavorite:onToggleFavorite,
          ),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
        ),
        children: [
            for(final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectCategory: (){
                    _selectCategory(context,category);
                }
          ),
        ],
      );
  }

}
