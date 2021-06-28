import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_table/components/form_button.dart';
import 'package:smart_table/components/login_text_field.dart';

class RegisterScreen extends StatefulWidget {
  static final String routeName = '/register_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email;
  String password;
  String repeatPassword;

  void _createUser() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

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
              _buildTitle(),
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
              SizedBox(height: 20),
              LoginTextField(
                hint: 'Repeat Password',
                isPasswordField: true,
                onValueChange: (value) {
                  this.repeatPassword = value;
                },
              ),
              SizedBox(height: 30),
              FormButton(
                title: 'Sign Up',
                onPress: () {
                  if (password == repeatPassword) {
                    print(email);
                    print(password);
                    _createUser();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Register',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.black,
      ),
    );
  }
}
