import 'package:lifttracker/models/exercisedata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseList {

  ExerciseList();

  List<ExerciseData> _exercises = [];

  Future<dynamic>? loadData() async {
    try {
      List<ExerciseData> tempList = [];
      final prefs = await SharedPreferences.getInstance();
      for (ExerciseData exercise in _exercises) {
        try {
          String? data = prefs.getString('${exercise.group.toString()};${exercise.title}');
          if (data != null) {
            tempList.add(ExerciseData.fromString(data));
          }
        // ignore: empty_catches
        } catch (e) {}
      }
      _exercises = tempList;
      return tempList;
    } catch (e) {
      return null; // there is nothing in shared preferences to read
    }
  }

  List<ExerciseData> getList() => _exercises;

  ExerciseData getExercise(int index) => _exercises[index];

  bool contains(exercise) {
    return _exercises.contains(exercise);
  }

  void add(ExerciseData newExercise) {
    _exercises.add(newExercise);
  }

  void remove(ExerciseData removing) {
    _exercises.removeWhere((item) => item.group == removing.group && item.title == removing.title);
  }

  ExerciseData removeAt(index) {
    return _exercises.removeAt(index);
  }

  void insert(index, exercise) {
    _exercises.insert(index, exercise);
  }

  void clear() {
    _exercises = [];
  }

  void set(List<ExerciseData> newList) {
    _exercises = newList;
  }

}