import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lifttracker/models/exercisedata.dart';

class EntryModal extends StatefulWidget {
  const EntryModal({super.key, required this.data});

  final ExerciseData data;

  @override
  State<EntryModal> createState() => _EntryModalState();
}

class _EntryModalState extends State<EntryModal> {
  
  late final TextEditingController name = TextEditingController(text: widget.data.title);
  late final TextEditingController weight = TextEditingController(text: widget.data.weight.toString());
  late final TextEditingController reps = TextEditingController(text: widget.data.reps.toString());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      clipBehavior: Clip.hardEdge,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              bottom: -150,
              left: -100,
              child: SvgPicture.asset(
                'assets/blob1.svg',
                width: 180.0,
                height: 280.0,
              )
            ),
            Positioned(
              top: -150,
              right: -100,
              child: SvgPicture.asset(
                'assets/blob2.svg',
                width: 180.0,
                height: 280.0,
              )
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Exercise",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(
                    controller: name,
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    "Weight",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(
                    controller: weight,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    "Reps",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextFormField(
                    controller: reps,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                        )
                      ),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            ExerciseData(
                              widget.data.group,
                              name.text,
                              double.parse(weight.text),
                              int.parse(reps.text)
                            )
                          );
                        },
                        child: const Text("Confirm")
                      )
                    ],
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}