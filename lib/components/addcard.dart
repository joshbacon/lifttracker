import 'package:flutter/material.dart';

class AddCard extends StatelessWidget {
  const AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // bring up a modal to enter the data
        // *** in the modal:
        // - store it to the device
        // -- probably need to setup some sort of state management with listeners
        // - have an option to delete it entierly
      },
      child: Card(
        color: Theme.of(context).colorScheme.surfaceDim,
        shadowColor: Theme.of(context).colorScheme.primary,
        elevation: 3.0,
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