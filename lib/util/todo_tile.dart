import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../color/colors.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final String description;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
           children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: mycomb1,
              borderRadius: BorderRadius.circular(150),
            ),
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.mode_edit_outline_outlined,
              backgroundColor: mycomb1,
              borderRadius: BorderRadius.circular(150),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blueGrey,
              Colors.blue,
              Colors.lightGreen
            ],
            ),
          borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Checkbox(value: taskCompleted,
                    onChanged: onChanged ,
                    activeColor: Colors.black,
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                     fontSize: 30,
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.all(8.0),
                child: SizedBox(height: 8, width: 20),
                 ),
              Text(
                description,
                style: TextStyle(
                color: Colors.black,
                decoration: taskCompleted
                    ?TextDecoration.lineThrough
                    :TextDecoration.none,
                  ),
                 ),
                ],
               ),
              ),
           ));
          }
         }