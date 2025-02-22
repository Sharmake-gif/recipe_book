import 'package:flutter/material.dart';
import 'package:cw2/recipe_detail.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Recipes Home';
    return MaterialApp(
      title: appTitle,
      home: RecipeHomeScreen(),
    );
  }
}

class RecipeHomeScreen extends StatelessWidget {
  const RecipeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Recipes Home';

    return Scaffold(
      appBar: AppBar(title: const Text(appTitle)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleSection(name: 'Egg Benedict', location: '40 mins'),
            ButtonSection(
              name: 'Egg Benedict',
              location: '40 mins',
              ingredients: [
                '2 eggs',
                '1 English muffin',
                '2 slices ham',
                'Hollandaise sauce',
              ],
              steps: [
                'Toast the English muffin and place ham on top.',
                'Poach the eggs in simmering water.',
                'Place poached eggs on the muffin and top with Hollandaise sauce.',
                'Serve immediately.',
              ],
            ),
            TitleSection(name: 'Blueberry Waffles', location: '30 mins'),
            ButtonSection(
              name: 'Blueberry Waffles',
              location: '30 mins',
              ingredients: [
                '1 cup flour',
                '1 egg',
                '1 cup milk',
                '2 tbsp sugar',
                '1 tsp baking powder',
                '1/2 tsp salt',
                '1/2 cup blueberries',
              ],
              steps: [
                'Mix all ingredients in a bowl except blueberries.',
                'Preheat waffle iron and grease it lightly.',
                'Pour batter into the iron and sprinkle blueberries.',
                'Cook until golden brown and serve with syrup.',
              ],
            ),
            TitleSection(
                name: 'Strawberry Yogurt Parfait', location: '10 mins'),
            ButtonSection(
              name: 'Strawberry Yogurt Parfait',
              location: '10 mins',
              ingredients: [
                '1 cup Greek yogurt',
                '1/2 cup granola',
                '1/2 cup strawberries (sliced)',
                '1 tbsp honey',
              ],
              steps: [
                'In a glass, layer yogurt, granola, and strawberries.',
                'Repeat the layers until the glass is full.',
                'Drizzle honey on top and serve immediately.',
              ],
            ),
            TitleSection(name: 'Smoked Salmon Bagel', location: '15 mins'),
            ButtonSection(
              name: 'Smoked Salmon Bagel',
              location: '15 mins',
              ingredients: [
                '1 bagel (sliced)',
                '2 tbsp cream cheese',
                '3 slices smoked salmon',
                '1 tsp capers',
                '1 slice red onion',
              ],
              steps: [
                'Toast the bagel until golden brown.',
                'Spread cream cheese evenly on both halves.',
                'Top with smoked salmon, capers, and red onion.',
                'Serve immediately.',
              ],
            ),
            TitleSection(
                name: 'Somali Pancakes (Malawax)', location: '25 mins'),
            ButtonSection(
              name: 'Somali Pancakes (Malawax)',
              location: '25 mins',
              ingredients: [
                '2 cups flour',
                '2 tbsp sugar',
                '1 tsp yeast',
                '1/2 tsp cardamom powder',
                '1 cup warm milk',
                '1 egg',
                '1/2 tsp salt',
                'Butter for cooking',
              ],
              steps: [
                'Mix flour, sugar, yeast, salt, and cardamom in a bowl.',
                'Add warm milk and egg, then whisk until smooth.',
                'Let the batter rest for 30 minutes.',
                'Heat a pan with butter and pour batter in small circles.',
                'Cook until bubbles form, then flip and cook until golden brown.',
                'Serve warm with honey or tea.',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  final String name;
  final String location;
  final List<String> ingredients;
  final List<String> steps;

  const ButtonSection({
    super.key,
    required this.name,
    required this.location,
    required this.ingredients,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetail(
                  name: name,
                  location: location,
                  ingredients: ingredients,
                  steps: steps,
                ),
              ),
            );
          },
          child: Row(
            children: [
              Icon(Icons.near_me, color: color),
              const SizedBox(width: 5),
              const Text('RECIPE'),
            ],
          ),
        ),
      ],
    );
  }
}
