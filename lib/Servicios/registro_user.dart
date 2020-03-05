import 'dart:convert';

import 'package:cineloj_v1/models/api_response.dart';
import 'package:cineloj_v1/models/register.dart';
import 'package:http/http.dart' as http;

class RegisterUserCLient {
  static const URLPost = 'http://192.168.100.27:8000/api--Register/';
  static const headers = {'Content-Type': 'application/json'};

  Future<APIResponse<bool>> createUser(RegisterUser item){
    return http.post(URLPost, headers: headers,body: json.encode(item.toJson())).then((data){
      if(data.statusCode == 201){
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'Se produjo un error al crear ');
    }).catchError((_)=> APIResponse<bool>(error: true, errorMessage: 'Ocurrio un error inesperado'));
  }
}