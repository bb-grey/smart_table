import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_table/components/form_button.dart';
import 'package:smart_table/components/login_text_field.dart';
import 'package:smart_table/screens/home_screen.dart';
import 'package:smart_table/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Log In',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              LoginTextField(
                hint: 'Email address',
                onValueChange: (value) {
                  this.email = value;
                },
              ),
              SizedBox(height: 20),
              LoginTextField(
                hint: 'Password',
                isPasswordField: true,
                onValueChange: (value) {
                  this.password = value;
                },
              ),
              SizedBox(height: 30),
              FormButton(
                title: 'Log In',
                onPress: () {
                  _loginUser();
                },
              ),
              SizedBox(height: 10),
              Text('OR'),
              SizedBox(height: 10),
              FormButton(
                title: 'Sign Up',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => RegisterScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
