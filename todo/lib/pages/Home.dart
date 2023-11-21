// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/DATA/database.dart';
import 'package:todo/util/Dialogbox.dart';
import 'package:todo/util/todotiles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TODOdatabase db = TODOdatabase();
  final _mybox = Hive.box('mybox');

  final _controller = TextEditingController();

  void SaveNewTask() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        db.todolist.add([_controller.text, false]);
        _controller.clear();
      });
      db.updatedata();
      Navigator.of(context).pop();
    } else {
      // Show an error message or handle the empty task name case as per your requirement
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text("Task name cannot be empty."),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: SaveNewTask,
              oncancel: () => Navigator.of(context).pop());
        });
  }

  void cheakboxchange(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updatedata();
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
  }

  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(224, 24, 24, 24),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(230, 30, 31, 31),
        title: const Center(child: Text("T O D O")),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return todotiles(
            TaskName: db.todolist[index][0],
            TaskComplete: db.todolist[index][1],
            onChanged: (value) => cheakboxchange(value, index),
            deletefunction: (context) => deleteTask(index),
          );
        },
      ),

      // Floating button
      floatingActionButton: SizedBox(
        width: 60.0, // Set your desired width
        height: 60.0, // Set your desired height
        child: FloatingActionButton(
            onPressed: createnewtask,
            backgroundColor: const Color.fromARGB(221, 71, 71, 71),
            child: const Icon(
              Icons.add,
            )),
      ),
      // Add some space at the end of the app
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 30.0),
      ),
    );
  }
}
