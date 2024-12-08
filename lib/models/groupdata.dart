import 'dart:convert';
import 'package:lifttracker/models/exercisedata.dart';

class GroupData {

  GroupData(int id, String title, List<ExerciseData> exercises) {
    _id = id;
    _title = title;
    _exercises = exercises;
  }

  GroupData.fromString(String json) {
    dynamic data = jsonDecode(json);
    _id = data["_id"];
    _title = data["_title"];
    _exercises = data["_exercises"];
  }

  late int _id;
  late String _title;
  late List<ExerciseData> _exercises;

  int get id => _id;
  String get title => _title;
  List<ExerciseData> get exercises => _exercises;

  void updateTitle(String newTitle) {
    _title = newTitle;
  }

  List<ExerciseData> addExercise(ExerciseData newExercise) {
    _exercises.add(newExercise);
    return _exercises;
  }

  List<ExerciseData> updateExercise(ExerciseData newExercise) {
    // _exercises.add(newExercise);
    //TODO: make this function
    return _exercises;
  }

  List<ExerciseData> removeExercise(int index) {
    _exercises.removeAt(index);
    return _exercises;
  }

  @override
  String toString() {
    String exies = "[${_exercises.map((e) => e.toString()).join(",")}]";
    final data = {"_id": _id, "_title": _title, "_exercises": exies};
    return jsonEncode(data);
  }

}