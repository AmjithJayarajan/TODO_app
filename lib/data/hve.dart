import 'package:hive/hive.dart';

class ToDohve{
  List todoList=[];

  final _Thebox = Hive.box('Thebox');

  void loadData(){
    todoList = _Thebox.get("TODOLIST");
  }
  void updateDataBase(){
    _Thebox.put("TODOLIST", todoList);
  }
}