import 'package:flutter/material.dart';
import 'screens/attendance_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AttendancePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
