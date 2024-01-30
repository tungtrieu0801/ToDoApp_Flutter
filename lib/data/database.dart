import 'package:hive_flutter/adapters.dart';

class TodoDatabase {

  List TodoTask = [];
  //reference the box

  final _myBox = Hive.box('mybox');

  //run when the 1st time opening this app

  void createInitialData (){
    TodoTask = [
      ["Tập thể dục", false],
      ["Học tiếng anh", false],
    ];
  }

  //load the data from database
  void loadData (){
    TodoTask = _myBox.get("TODOLIST");
  }

  //update the database
  void updateData (){
    _myBox.put("TODOLIST", TodoTask);
  }
}