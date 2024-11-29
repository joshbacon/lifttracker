import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lifttracker/components/addcard.dart';
import 'package:lifttracker/components/exercisecard.dart';
import 'package:lifttracker/models/exercisedata.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key, required this.title, required this.id});

  final String title;
  final int id;

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {

  List<ExerciseData> exerciseData = [
    ExerciseData(1, 'Military Press', 60, 3),
    ExerciseData(1, 'Flies', 35, 8),
    ExerciseData(1, 'Rear Delt Cable Flies', 15, 12),
  ];

  @override
  Widget build(BuildContext context) {

    ExerciseData total = exerciseData.reduce((v, e) {
      return ExerciseData(e.group, "Total", e.weight + v.weight, 1);
    });

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.surfaceDim,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
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
                children: [...exerciseData.map((exercise) => ExerciseCard(data: exercise)), const AddCard()],
              ),
          ),
        ],
      ),
    );
  }
}