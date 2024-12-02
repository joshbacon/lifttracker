import 'package:flutter/material.dart';
import 'package:lifttracker/models/exercisedata.dart';
import 'package:lifttracker/models/groupdata.dart';
import 'package:lifttracker/widgets/entrymodal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key, required this.groupData});

  final GroupData groupData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        ExerciseData? newExercise = await showDialog<ExerciseData>(
          context: context,
          builder: (context) => EntryModal(data: ExerciseData.newEntry(groupData.id))
        );
        if (newExercise != null) {
          groupData.addExercise(newExercise);
          try {
            final prefs = await SharedPreferences.getInstance();
            prefs.setString(groupData.id.toString(), groupData.toString());
          } finally {}
        }
      },
      child: Card(
        color: Theme.of(context).colorScheme.surfaceDim,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 5.0,
        child: Center(
          child: Icon(
            Icons.add_rounded,
            size: 48.0,
            color: Theme.of(context).colorScheme.primary,
          )
        ),
      ),
    );
  }
}