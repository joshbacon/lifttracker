

class GroupData {

  GroupData(int id, String title) {
    _id = id;
    _title = title;
  }

  late int _id;
  late String _title;

  int get id => _id;
  String get title => _title;

  void updateTitle(String newTitle) {
    _title = newTitle;
  }

}