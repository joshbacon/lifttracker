import 'package:flutter/material.dart';
import 'package:lifttracker/models/groupdata.dart';
import 'package:lifttracker/pages/group.dart';

class GroupCard extends StatefulWidget {
  const GroupCard({super.key, required this.data});

  final GroupData data;

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GroupPage(data: widget.data))
        );
        setState(() {});
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
              widget.data.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '${widget.data.exercises.length} exercise${widget.data.exercises.length == 1 ? '' : 's'}'
            ),
          ],
        ),
      ),
    );
  }
}