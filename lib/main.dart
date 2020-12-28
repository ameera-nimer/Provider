import 'package:ProviderAssignment/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_provider.dart';

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


