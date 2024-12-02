import 'package:flutter/material.dart';
import 'package:lifttracker/models/exercisedata.dart';

class ExerciseCard extends StatefulWidget {
  const ExerciseCard({super.key, required this.data});

  final ExerciseData data;

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // bring up the same modal as the add card but prefill the existing data in
      },
      child: Card(
        color: Theme.of(context).colorScheme.surfaceDim,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 5.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.data.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Text(
              '${widget.data.weight}lbs for ${widget.data.reps}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}