import 'package:my_mimed/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:my_mimed/themes.dart';

void main() => runApp(const MyMimedApp());

class MyMimedApp extends StatelessWidget {
  const MyMimedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeRoute(),
      theme: ThemeData(
        primaryColor: secondaryPrimaryColor,
        fontFamily: 'PurplePurse'
      ),
    );
  }
}
