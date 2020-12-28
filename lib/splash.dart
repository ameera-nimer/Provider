import 'package:ProviderAssignment/todo_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:ProviderAssignment/db_helper.dart';

 class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBHelper.dbHelper.selectAllTasks().then((value) => {
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
           return ToDoApp(value);
      }))
    });
    return Scaffold(
      body: Center(
                child:Image(image: AssetImage('assets/splashimage.webp') ,height: 150 , width: 150,),
      ),
    );
  }

}