import 'package:flutter/material.dart';
import 'package:pr5/second.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Screen extends StatelessWidget {
  const Screen(this.sharedPreferences, {super.key});
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          sharedPreferences.getString('text')!,
          style: const TextStyle(
            fontSize: 26,
          )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage(sharedPreferences)));},
        tooltip: 'Назад',
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}