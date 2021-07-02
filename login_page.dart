import 'dart:ui';

import 'package:untitled/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  String? username;
  String? password;
  final _formKey = GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(

            key: _formKey,

            child: Padding(


              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Image.asset("assets/images/uniLogo.png"),
                  SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30,
                    ),

                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: "Kullanıcı Adı",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Kullanıcı adınızı giriniz";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        username = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30),
                    child: TextFormField(
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: (){
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: "Parola",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),

                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Parolanızı giriniz";
                        } else {
                          return null;
                        }

                      },

                      onSaved: (value) {

                        password = value;
                      },
                    ),
                  ),
                  _loginButton(),
                  SizedBox(height: 180),

                  Text('Antalya Bilim Üniversitesi Bilgi Teknolojileri Müdürlüğü',style:TextStyle(fontSize: 12,height: 10) ),



                ],

              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _loginButton() =>
      // ignore: deprecated_member_use
  RaisedButton(
    child: Text("Giriş Yap",),
    onPressed: () {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),

        );
      }
    },
  );

}
