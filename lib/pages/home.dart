import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifttracker/components/musclecard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<MuscleCard> muscleCards = [
    const MuscleCard(title: 'Chest'),
    const MuscleCard(title: 'Shoulders'),
    const MuscleCard(title: 'Back'),
    const MuscleCard(title: 'Arms'),
    const MuscleCard(title: 'Core'),
    const MuscleCard(title: 'Legs'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
              children: muscleCards,
            ),
          ),
        ],
      ),
    );
  }
}