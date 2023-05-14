import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes.dart';
import 'package:flutter_application_1/myhomepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String name = "";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/panda.jpeg",
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Username..",
                        labelText: "Username",
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black26),
                            borderRadius: BorderRadius.circular(15))),
                    onChanged: (value) {
                      print(value);
                      name = value;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter Password..",
                        labelText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.black26),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Text("SignUp"), // <-- Text
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.MyHomePage);
                  },
                  icon: Icon(
                    // <-- Icon
                    Icons.download,
                    size: 24.0,
                  ),
                  label: Text('Download'), // <-- Text
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
