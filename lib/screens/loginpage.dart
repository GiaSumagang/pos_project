import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pos_project/Drawer%20Pages/homepage.dart';
import 'package:pos_project/screens/registerpage.dart';
import '../auth/auth_services.dart';
import '../auth/globals.dart';
import '../extra/rounded_button.dart';
import '../extra/squaretile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textemail = TextEditingController();
  TextEditingController textpassword = TextEditingController();

  //String _email = '';
  //String _password = '';

  loginPressed() async {
    if (textemail.text.isNotEmpty && textpassword.text.isNotEmpty) {
      http.Response response =
          await AuthServices.login(textemail.text, textpassword.text);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                const Icon(
                  Icons.note_alt_rounded,
                  size: 100,
                  color: Colors.white,
                ),
                Text(
                  'School Supplies',
                  style:
                      GoogleFonts.albertSans(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 50),
                Card(
                  color: Colors.grey,
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              controller: textemail,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  labelText: "Email Address",
                                  prefixIcon: Icon(Icons.email),
                                  prefixIconColor: Colors.blue,
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ),
                      SizedBox(
                        height: 100,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              controller: textpassword,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: Icon(Icons.password),
                                  prefixIconColor: Colors.blue,
                                  labelStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            )),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                             context, MaterialPageRoute(builder: (context) => const HomePage()),
                             );
                          },
                      child: Text('LOG IN'),
                    ),
                    const SizedBox(height: 30),

                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google button
                    SquareTile(imagePath: 'assets/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'assets/fb.png')
                  ],
                ),
                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage());
                        },
                        child: const Text(
                          ' Register Now',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ]),
            )]))));
  }
}
