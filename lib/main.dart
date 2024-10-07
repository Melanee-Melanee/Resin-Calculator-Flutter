import 'package:flutter/material.dart';
import 'InputPage.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp]);
  runApp(ResinCalculator());
}
class ResinCalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor:
        Color(0XFF0A0E21),
       // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:InputPage(),
    );
  }
}
