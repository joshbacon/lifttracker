import 'package:flutter/material.dart';
import 'package:lifttracker/models/groupdata.dart';
import 'package:lifttracker/pages/group.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({super.key, required this.data});

  final GroupData data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GroupPage(data: data))
        );
      },
      child: Card(
        color: Theme.of(context).colorScheme.surfaceDim,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 5.0,
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              data.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${data.exercises.length} exercises'
            ),
          ],
        ),
      ),
    );
  }
}