import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:ProviderAssignment/task_model.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';
import 'db_helper.dart';

class TaskWidget extends StatefulWidget{
   Task task ;
   Function function;
  TaskWidget(this.task , [this.function]);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(child:Consumer<AppProvider>(
        builder:(context , value2 , child){
         return Card(
  margin: EdgeInsets.all(10),
  child :Padding(
    padding: EdgeInsets.symmetric(horizontal :  15),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          IconButton(
                        icon: Icon(Icons.delete),
                        iconSize: 24.0,
                        color: Colors.grey,
                        onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) {
                                 return Center(
                                   child: AlertDialog(
                                      title: Text("Alert"),
                                      content: Text("You Will Delete A Task , are you \n sure? "), 
                                      actions: <Widget>[
                                         FlatButton(
                                           child: Text("Ok"),
                                           onPressed: () {
                                             Task task = Task(value2.taskName,value2.isComplete );
                                             //DBHelper.dbHelper.deleteTask(task);
                                             Navigator.pop(context, false);
                                             context.read<AppProvider>().deleteTask(widget.task.taskName,widget.task.isComplete);


                                           },
                                          ),
                                         FlatButton(
                                           child: Text("NO"),
                                           onPressed: () {
                                           Navigator.pop(context, true);
                                           },
                                            ),
                                            ],
                                           )
      
                                 
                                 
                                 
                                 
                                 
                                 );
                               },
                              );

                   },
               ),
       Text(widget.task.taskName),
       Checkbox(
         value: widget.task.isComplete, 
         onChanged: (value){
           Task task = Task(widget.task.taskName ,value );
          DBHelper.dbHelper.updateTask(task);
          this.widget.task.isComplete=!this.widget.task.isComplete;
          context.read<AppProvider>().update();

          widget.function();
       }),
],),
  ));
        } ,
      )
      );
  }
}