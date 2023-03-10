import 'dart:convert';

import 'package:cineloj_v1/models/api_response.dart';
import 'package:cineloj_v1/models/list_movie.dart';
import 'package:cineloj_v1/models/movie_consulta.dart';
import 'package:http/http.dart' as http;


class MovieService {

  static const APIUrl ='https://cineloj-backend.herokuapp.com/api--movie-document/';
  //static const APIUrl ='http://192.168.100.27:8000/api--movie-document/';
  static const headers = {'Content-Type': 'application/json'};

  /**
   * Servicio para listar las peliculas disponibles 
   */
  Future<APIResponse<List<ListMovie>>> getMovieList() async{

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
  }
/**
 * Servicio para enviar a consulta
 */
  Future<APIResponse<MovieConsulta>> getMovie(String movieId){
    return http.get(APIUrl + movieId, headers: headers).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
        return APIResponse<MovieConsulta>(data: MovieConsulta.fromJson(jsonData));
      }
      return APIResponse<MovieConsulta>(error: true, errorMessage: 'Hay un error al obtener los datos');
    })
        .catchError((_)=> APIResponse<MovieConsulta>(error: true, errorMessage: 'Hay un error en el servicio'));
  }


}

