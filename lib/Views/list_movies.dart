import 'package:carousel_pro/carousel_pro.dart';
import 'package:cineloj_v1/Servicios/movieService.dart';
import 'package:cineloj_v1/models/api_response.dart';
import 'package:cineloj_v1/models/list_movie.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'movie_ticket.dart';

const AppbarColor = Color(0xFF303F9F);
const CardColor = Color(0xFF9FA8DA);

class MovieList extends StatefulWidget{

  @override
  _MovieListState createState() => _MovieListState();
}
/**
 * Cuerpo de la aplicacion
 */
class _MovieListState extends State<MovieList> {

  MovieService get service => GetIt.I<MovieService>();

  APIResponse<List<ListMovie>> _apiResponse;
  bool _isLoading = false;


  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState(){
    _fetchMovies();
    super.initState();
  }

  _fetchMovies() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getMovieList();

    setState(() {
      _isLoading = false;
    });
  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: AppbarColor,
        elevation: 0.0,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 32.0),
          child: Column(

            children: <Widget>[
              Text('CineLoj'),
            ],
          ),
        ),
      ),
      body:  Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 280/2,
              color: AppbarColor,

            ),
            SizedBox(height: 10,),
             Padding(
                padding: const EdgeInsets.all(8.0),
               child: Center(
                  child:_servicio() ,
                ),
              ),


          ],
        ),


    );
  }
  Widget _servicio(){
    return  Builder(
      builder: (context) {
        if(_isLoading){
          return Center(
            child: CircularProgressIndicator(),);
        }
        if(_apiResponse.error){
          return Center(child: Text(_apiResponse.errorMessage));
        }
        return ListView.separated(
            separatorBuilder: (_, __)=> Divider(height: 0, color: Colors.transparent),
            itemBuilder: (_, index){
              /**
               *Seccin para poder hacer un slash para eliminar un regstro
               */
              return Dismissible(
                key: ValueKey(_apiResponse.data[index].id),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction){

                },
                confirmDismiss: (direction) async{
                  final result = await showDialog(
                    context: context,
                    //builder: (_)=> NoteDelete()//se llama al widget para llamar a la confirmacion
                  );
                  print(result);
                  return result;
                },
                background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    child: Icon(Icons.delete, color: Colors.white,),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                /**
                 * list title en donde se mustra la lista de registros
                 */
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    color: CardColor,
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[

                        ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage('assets/cinelog.png')),

                          title: Text(
                            _apiResponse.data[index].Name,
                            style: TextStyle(color: Theme.of(context).bottomAppBarColor),
                          ),
                          subtitle: Text(
                              'Last edited on ${formatDateTime(_apiResponse.data[index].DatePremiere)}'
                          ),
                          trailing: Icon(Icons.movie, size: 40),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (_) => MovieScreen(movieId: _apiResponse.data[index].id)));
                            //Navigator.of(context).push(MaterialPageRoute(builder: (_)=> NoteModify(noteID: _apiResponse.data[index].noteID,)));
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: _apiResponse.data.length);
      },

    );
  }
}

Widget _search(){
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextField(
      onChanged: (val) {

      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 25.0),
        hintText: 'Search ',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: null,
        ),
      ),
    ),
  );
}