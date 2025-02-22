import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  final String name;
  final String location;
  final List<String> ingredients;
  final List<String> steps;

  const RecipeDetail({
    super.key,
    required this.name,
    required this.location,
    required this.ingredients,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Time Required: $location',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'Ingredients:',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ...ingredients
                  .map((ingredient) => Text('- $ingredient'))
                  .toList(),
              const SizedBox(height: 20),
              Text(
                'Steps:',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ...steps.asMap().entries.map((entry) {
                int stepNumber = entry.key + 1;
                return Text('$stepNumber. ${entry.value}');
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
