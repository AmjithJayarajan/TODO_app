
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_test/color/colors.dart';
import 'package:todo_test/data/hve.dart';
import '../color/colors.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _Thebox = Hive.box('Thebox');
  ToDohve hv = ToDohve();

  @override
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  void checkBoxChanged(bool? value, int index){
    setState(() {
      hv.todoList[index][1] = !hv.todoList[index][1];
    });
    hv.updateDataBase();
  }

  void savenewTask(){
    setState(() {
       hv.todoList.add([_controller.text,false,_controller2.text]);
      _controller.clear();
      _controller2.clear();
    });
    Navigator.of(context).pop();
    hv.updateDataBase();
  }
  void saveAnotherTask(){
    setState(() {
         hv.todoList.add([_controller2.text,false]);
         _controller2.clear();
    });
    Navigator.of(context).pop();
    hv.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          controller2: _controller2,
          onSave: savenewTask,
          onCancel: () => Navigator.of(context).pop(),
          onUpdate: () {  },
        );
      },
    );
  }

  void editTask(int index) {
    _controller.text = hv.todoList[index][0];
    _controller2.text = hv.todoList[index][2];
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          controller2: _controller2,
          onUpdate: () {
            setState(() {
              hv.todoList[index][0] = _controller.text;
              hv.todoList[index][2] = _controller2.text;
              _controller.clear();
              _controller2.clear();
              Navigator.of(context).pop();
            });
          },
          onCancel: () {
            _controller.clear();
            _controller2.clear();
            Navigator.of(context).pop();
          },  onSave: () {  },
        );
      },
    );
  }


  void deleteTask(int index) {
    setState(() {
      hv.todoList.removeAt(index);
    });
    hv.updateDataBase();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey,
              Colors.black,
              Colors.blue,
            ]),
          ),
        ),
        centerTitle: true,
        title: Text('To-Do'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      backgroundColor: Colors.white70,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.teal,
            Colors.green,
          ]),
          borderRadius: BorderRadius.circular(20)
        ),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          onPressed: createNewTask,
          child: Icon(Icons.add),
          backgroundColor: Colors.transparent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
          itemCount: hv.todoList.length,
          itemBuilder: (context, index){

            return ToDoTile(
              taskName:hv.todoList[index][0],
              taskCompleted: hv.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
              editFunction: (BuildContext ) => editTask(index),
              description: hv.todoList[index][2],
            );
         }
      ),
    );
  }
}
