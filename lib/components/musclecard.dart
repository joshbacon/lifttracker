import 'package:flutter/material.dart';

class MuscleCard extends StatelessWidget {
  const MuscleCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: navigate to the individual page
      },
      child: Card(
        color: Theme.of(context).colorScheme.onSurface.withAlpha(175),
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 10.0,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ),
      ),
    );
  }
}