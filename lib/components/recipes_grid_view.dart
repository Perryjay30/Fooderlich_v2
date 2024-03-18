import 'package:flutter/material.dart';
import '../components/components.dart';
import '../models/models.dart';
import '../components/recipe_thumbnail.dart';


class RecipesGridView extends StatelessWidget {

  final List<SimpleRecipe> recipes;
  const RecipesGridView({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top:
        16),
        child: GridView.builder(
            itemCount: recipes.length,
            gridDelegate:
            const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500.0),
            //   const SliverGridDelegateWithMaxCrossAxisExtent (
            //     maxCrossAxisExtent: 300,
            //     mainAxisSpacing: 16,
            //     crossAxisSpacing: 16,
            //     childAspectRatio: 1,
            // ),
            // const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2),
            itemBuilder: (context, index) {
              final simpleRecipe = recipes[index];
              return RecipeThumbnail(recipe: simpleRecipe);
            }));
  }
}