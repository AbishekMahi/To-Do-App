import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/utils/dialogbox.dart';
import 'package:to_do_app/utils/todo_tile.dart';
import '../data/database.dart';

class HomepPage extends StatefulWidget {
  const HomepPage({super.key});

  @override
  State<HomepPage> createState() => _HomepPageState();
}

class _HomepPageState extends State<HomepPage> {
  // reference the hive box
  final _mybox = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // first time ever open this app, then create default data
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // already exist data
      db.loadData();
    }

    super.initState();
  }

// text controller
  final _controller = TextEditingController();

  // list of tasks
  // List todoList = [
  //   ["Make App", true],
  //   ["Make Website", false],
  //   ["Read books", true],
  // ];

  // save new task
  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // check box taped
  void chekBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  // create tast
  void createTask() {
    showDialog(
      context: context,
      builder: ((context) {
        return DialogeBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveTask,
        );
      }),
    );
  }

// delete task
  void deleteTask(index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.checklist_sharp,
                size: 28,
              ),
            ),
            Text(
              "TO DO",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => chekBoxChanged(value, index),
            deleteTaskFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
