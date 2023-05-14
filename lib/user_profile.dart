import 'package:flutter/material.dart';
import 'package:http_request/api/user_login_model.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key, required this.userLoginModel}) : super(key: key);

  final UserLoginModel userLoginModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(userLoginModel.name.toString()),
        centerTitle: true,
      ),
      
      body: ListTile(
        leading: CircleAvatar(radius: 30, child: Image.network("https://img.freepik.com/free-icon/user_318-159711.jpg",)),
        title: Text(userLoginModel.name.toString()),
        subtitle: Text(userLoginModel.phone.toString()),
        trailing: Text(userLoginModel.emailVerifiedAt.toString()
        ),
      ),
    );
  }
}
