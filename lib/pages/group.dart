import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/models/groupdata.dart';
import 'package:lifttracker/widgets/addcard.dart';
import 'package:lifttracker/widgets/exercisecard.dart';
import 'package:lifttracker/models/exercisedata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key, required this.data});

  final GroupData data;

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {

  @override
  Widget build(BuildContext context) {

    ExerciseData total = widget.data.exercises.isNotEmpty ? widget.data.exercises.reduce((v, e) {
      return ExerciseData(e.group, "Total", e.weight + v.weight, 1);
    }) : ExerciseData(widget.data.id, "Total", 0, 1);

    void updateExercise(ExerciseData? newData) async {
      if (newData != null) {
        try {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString(newData.group.toString(), newData.toString());
        } finally {
          //TODO: know when t call each of these
          //widget.data.addExercise(newData);
          //widget.data.updateExercise(newData);
          setState(() {});
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.surfaceDim,
        title: Text(
          widget.data.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.surface,
            ],
            stops: const [0.0, 0.15],
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Theme.of(context).colorScheme.surfaceDim,
              shadowColor: Theme.of(context).colorScheme.primary,
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total Weight:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      '${total.weight} lbs',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              )
            ),
            Expanded(
              child: GridView.count(
                  padding: const EdgeInsets.all(12.0),
                  crossAxisCount: 2,
                  dragStartBehavior: DragStartBehavior.down,
                  children: [
                    ...widget.data.exercises.map((exercise) => ExerciseCard(data: exercise, hoistRefresh: updateExercise)),
                    AddCard(groupData: widget.data, hoistRefresh: updateExercise)
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}