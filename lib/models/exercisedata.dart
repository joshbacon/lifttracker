

class ExerciseData {

  ExerciseData(int group, String title, double weight, int reps) {
    _group = group;
    _title = title;
    _weight = weight;
    _reps = reps;
  }

  late int _group;
  late String _title;
  late double _weight;
  late int _reps;

  int get group => _group;
  String get title => _title;
  double get weight => _weight;
  int get reps => _reps;

  void updateTitle(String newTitle) {
    _title = newTitle;
  }

  void updateWeight(double newWeight) {
    _weight = newWeight;
  }

  void updateReps(int newReps) {
    _reps = newReps;
  }

}