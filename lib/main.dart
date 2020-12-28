import 'package:ProviderAssignment/splash.dart';
import 'package:ProviderAssignment/todo_app.dart';
import 'package:flutter/material.dart';
import 'package:ProviderAssignment/new_task.dart';
import 'package:ProviderAssignment/task_model.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';

import 'db_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider<AppProvider>(
      create: (context){
        return AppProvider();
      },
          child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        home: SplashScreen(),
      ),
    );

  }
}


