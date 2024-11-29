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
          MaterialPageRoute(builder: (context) => GroupPage(title: data.title, id: data.id))
        );
      },
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 3.0,
        child: Center(
          child: Text(
            data.title,
            style: Theme.of(context).textTheme.titleMedium,
          )
        ),
      ),
    );
  }
}