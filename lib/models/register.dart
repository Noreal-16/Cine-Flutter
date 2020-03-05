import 'package:flutter/foundation.dart';

class RegisterUser {
  String Name;
  String LastName;
  String Password;

  RegisterUser({
    @required this.Name,
    @required this.LastName,
    @required this.Password
  });



  Map<String, dynamic> toJson(){
    return{
      "Name": Name,
      "LastName": LastName,
      "Password": Password
    };
  }
}