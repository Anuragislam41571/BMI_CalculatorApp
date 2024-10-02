import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'home.dart';

void main (){





runApp(myapp())  ;





}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: home(),
theme: ThemeData(

  appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,

    backgroundColor: Colors.blueGrey,
    titleTextStyle: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w900,


    )

  ),

  inputDecorationTheme: InputDecorationTheme(

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(2),
      borderSide: BorderSide(width: 2,color: Colors.blue)
    ),
    enabledBorder: OutlineInputBorder(

      borderSide: BorderSide(width: 2)
    )

  )


),
    );
  }
}
