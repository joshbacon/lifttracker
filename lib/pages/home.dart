import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifttracker/components/groupcard.dart';
import 'package:lifttracker/models/groupdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<GroupData> groups = [
    GroupData(0, 'Chest'),
    GroupData(1, 'Shoulders'),
    GroupData(2, 'Back'),
    GroupData(3, 'Arms'),
    GroupData(4, 'Core'),
    GroupData(5, 'Legs'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceDim,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset('assets/blob1.svg'),
                SvgPicture.asset('assets/logo.svg', width: 90.0, height: 90.0,),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(12.0),
              crossAxisCount: 2,
              dragStartBehavior: DragStartBehavior.down,
              children: groups.map((group) => GroupCard(data: group)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}