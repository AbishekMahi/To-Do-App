import 'package:hive/hive.dart';

class ToDoDatabase {
  List todoList = [];
  // reference the hive box
  final _mybox = Hive.box("mybox");
// first time ever open this app
  void createInitialData() {
    todoList = [
      ["Make App", true],
      ["Read books", false],
    ];
  }

  // load data from db
  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  // update th db
  void updateDataBase() {
    _mybox.put("TODOLIST", todoList);
  }
}
