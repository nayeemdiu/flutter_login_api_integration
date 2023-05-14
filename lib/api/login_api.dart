
import 'dart:convert';
import 'dart:io';

import 'package:http_request/api/user_login_model.dart';

class LoginApi{

  static Future<UserLoginModel?> fetch (String email, String password) async {



    //Api url
    String url = 'https://apingweb.com/api/login';

    //Authentication
    Map<String, String> body = {"email": email, "password": password};

    HttpClient httpClient = HttpClient();

    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));

    // content type
    request.headers.set('content-type', 'application/json');

    request.add(utf8.encode(json.encode(body)));

    //Get response
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();

    // Closed request
    httpClient.close();

    final data = jsonDecode(reply);

    if(data["success"]){

      UserLoginModel userLoginModel = UserLoginModel.formMap(data["result"]);
      return userLoginModel ;

    }

    return null;
  }

}