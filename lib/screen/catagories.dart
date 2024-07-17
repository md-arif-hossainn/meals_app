import 'package:flutter/material.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';

class CategoriesScreen extends StatelessWidget{

  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category){
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    ///Navigator.push(context, route)
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals
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
