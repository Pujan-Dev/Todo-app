import 'package:hive_flutter/hive_flutter.dart';

class TODOdatabase {
  List todolist = [];
  final _mybox = Hive.box("mybox");

  void createInitialData() {
    todolist = [
      //task, done/undone
      ['Make a coffee ', false],
      ['slide  form right to left to delete', false]
    ];
  }

  void loaddata() {
    todolist = _mybox.get("TODOLIST");
  }

  void updatedata() {
    _mybox.put("TODOLIST", todolist);
  }
}
