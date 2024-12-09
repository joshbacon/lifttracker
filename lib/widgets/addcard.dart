import 'package:flutter/material.dart';
import 'package:lifttracker/models/exercisedata.dart';
import 'package:lifttracker/models/groupdata.dart';
import 'package:lifttracker/widgets/entrymodal.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key, required this.groupData, required this.hoistRefresh});

  final GroupData groupData;
  final Function hoistRefresh;

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        ExerciseData? newExercise = await showDialog<ExerciseData>(
          context: context,
          builder: (context) => EntryModal(data: ExerciseData.newEntry(widget.groupData.id))
        );
        widget.hoistRefresh(-1, newExercise);
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