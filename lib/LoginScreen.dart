import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRemember = false;
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 10, right: 10),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff5ac18e),
                ),
                hintText: "Email",
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: const TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14, left: 10, right: 10),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff5ac18e),
                ),
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }

  Widget buildRemember() {
    return Container(
      height: 20,
      child: Row(
        children: [
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: isRemember,
                checkColor: Colors.green,
                activeColor: Colors.white,
                onChanged: (val) {
                  // setState(() {
                  //   isRemember = val;
                  // });
                },
              )),
          const Text(
            "Remember Me",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildLoginbutton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () async {
          String email = EmailController.text;
          String password = PasswordController.text;

          SharedPreferences perfs = await SharedPreferences.getInstance();

          if (email == "pateljeet341@gmail.com" && password == "jeet123") {
            await perfs.setBool("isLoggedIn ", true);

            Navigator.of(context).pushReplacementNamed('introscreen');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("wrong credentials"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ));
          }
        },
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: const Text(
          "Login",
          style: TextStyle(
              color: Color(
                0xff5ac18e,
              ),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xff5ac18e),
                      Color(0x995ac18e),
                      Color(0xcc5ac18e),
                      Color(0xff5ac18e),
                    ])),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      buildEmail(),
                      const SizedBox(height: 20),
                      buildPassword(),
                      const SizedBox(height: 10),
                      buildRemember(),
                      const SizedBox(height: 30),
                      buildLoginbutton()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
