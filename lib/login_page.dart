import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_request/api/login_api.dart';
import 'package:http_request/api/user_login_model.dart';
import 'package:http_request/user_profile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(" Login Page",
                      style: TextStyle(fontSize: 20,color: Colors.pink)),
              ),

              TextField(
                controller: emailController,

                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'Enter Your Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
              ),

              SizedBox(height: 30,),

              TextField(
                controller: passwordController,
                obscureText: true ,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
              ),
              SizedBox(height: 10,),

              GestureDetector(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon (Icons.login, color: Colors.deepOrange,),
                ),

                onTap: () async {

                  print(emailController.text);
                  print(passwordController.text);

                 UserLoginModel? userModel = await LoginApi.fetch(emailController.text, passwordController.text);
                 if(userModel != null){

                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> UserProfile(userLoginModel: userModel)));

                 }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
