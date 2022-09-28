import 'package:flutter/material.dart';
import 'package:online_shoping/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'introscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences perfs = await SharedPreferences.getInstance();

  bool? isLoggedIn = perfs.getBool("isLoggedIn") ?? false;
  bool? isRemember = perfs.getBool("isRemember") ?? false;
  runApp(
    MaterialApp(
      title: 'Login ui',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      initialRoute: (isRemember == false)
          ? 'introscreen'
          : (isLoggedIn == false)
              ? 'LoginScreen'
              : '/',
      routes: {
        'homepage': (context) => HomePage(),
        'LoginScreen': (context) => LoginScreen(),
        'Introscreen': (context) => introscreen(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: TextButton(
        onPressed: () {},
        child: Text("First login after "),
      ),
    );
  }
}
