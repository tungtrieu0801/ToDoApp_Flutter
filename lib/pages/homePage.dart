import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/data/database.dart';

import '../util/diaglogBox.dart';
import '../util/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');

  final _controller = TextEditingController();
  //list of todo task
  TodoDatabase db = TodoDatabase();
  @override
  void initState() {
    //if this is the first time open app, create default data
    if(_myBox.get("TODOLIST")==null){
        db.createInitialData();
    }else{
      //already exist data
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChange(bool? value , int index) {
    setState(() {
      db.TodoTask[index][1] = !db.TodoTask[index][1];
    });
    db.updateData();
  }
  //save

  void saveNewTask (){
    setState(() {
      db.TodoTask.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }
  //create new task
  void createNewTask (){
    showDialog(context: context, builder: (context) {
      return alertDialog(
        onSave: saveNewTask,
        onCancel:()=> Navigator.of(context).pop(),
        controller: _controller,
      );
    });
  }

  void deleteTask (int index){
    setState(() {
      db.TodoTask.removeAt(index);
    });
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text("TO DO", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.TodoTask.length,
        itemBuilder: (context, index) {
          return ToDoList(
              taskName: db.TodoTask[index][0],
              taskCompleted: db.TodoTask[index][1],
              deleteFuntion: (context) => deleteTask(index),
              onChanged: (value) => checkBoxChange(value, index));
        },
      ),
    );
  }
}
