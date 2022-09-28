import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class introscreen extends StatefulWidget {
  const introscreen({Key? key}) : super(key: key);

  @override
  State<introscreen> createState() => _introscreenState();
}

class _introscreenState extends State<introscreen> {
  checkperfs() async {
    SharedPreferences perfs = await SharedPreferences.getInstance();

    Timer(Duration(seconds: 3), () async {
      await perfs.setBool("isIntrovisited", true);

      Navigator.of(context).pushReplacementNamed('LoginScreen');
    });
  }

  @override
  void initState() {
    super.initState();
    checkperfs();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            FlutterLogo(
              size: 250,
            ),
            CircularProgressIndicator(),
            Text(
              "Made With In India",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
