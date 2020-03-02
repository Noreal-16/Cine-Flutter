import 'dart:convert';

import 'package:cineloj_v1/models/api_response.dart';
import 'package:cineloj_v1/models/list_movie.dart';
import 'package:http/http.dart' as http;


class MovieService {

  static const APIUrl ='http://192.168.100.27:8000/api--movie-document/';
  static const headers = {'Content-Type': 'application/json'};

  Future<APIResponse<List<ListMovie>>> getMovieList() async {
    final response = await http.get(APIUrl);
    List jsonResponse = json.decode(response.body);
    if(response.statusCode == 200){
      //jsonResponse.forEach((element) => print(element));
      final jsonData = json.decode(response.body);
      final jsonList = <ListMovie>[];
      for(var item in jsonData){
        jsonList.add(ListMovie.fromJson(item));
      }
      return APIResponse<List<ListMovie>>(data: jsonList);
    }
    return APIResponse<List<ListMovie>>(error: true, errorMessage: 'a ocuerrudo u error');
  }

/*Future<APIResponse<List<ListMovie>>> getMovieList() async{

    return http.get(APIUrl).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final movies = <ListMovie>[];
        for(var item in jsonData){
          movies.add(ListMovie.fromJson(item));
        }
        return APIResponse<List<ListMovie>>(data: movies);
      }
      return APIResponse<List<ListMovie>>(error: true, errorMessage: 'A ocurrido un error al importar la data');
    })
        .catchError((_) => APIResponse <List<ListMovie>>(error: true, errorMessage: 'A ocurrido un error inesperado'));
  }*/

}