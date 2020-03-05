import 'package:cineloj_v1/Servicios/movieService.dart';
import 'package:cineloj_v1/Views/ticket_detalle.dart';
import 'package:cineloj_v1/models/movie_consulta.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'home.dart';

const AppbarColor = Color(0xFF303F9F);
const CardFoot = Color(0xFF9FA8DA);


class MovieScreen extends StatefulWidget {

  final int movieId;
  MovieScreen({this.movieId});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {

  bool get isEditing => widget.movieId != null;

  MovieService get service => GetIt.I<MovieService>();

  String errorMessage;
  MovieConsulta movie;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _generoController = TextEditingController();
  TextEditingController _descriptionController =TextEditingController();

  bool _isloading = false;

  @override
  void initState() {
    super.initState();
    if(isEditing){
      setState(() {
        _isloading = true;
      });

      service.getMovie(widget.movieId.toString()).then((response){
        setState(() {
          _isloading = false;
        });

        if(response.error){
          errorMessage = response.errorMessage ?? 'A ocurrido un error';
          }
        //_nameController.text = movie.Name;
        //_generoController.text = movie.Genus;
        //_descriptionController.text = movie.Description;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: AppbarColor,
          title: Text('Cineloj'),
        ),
        bottomNavigationBar: BottomAppBar(
          color: CardFoot,
          elevation: 20.0,
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>CineHome()));
                },
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TicketDetalle()));
                },
                icon: Icon(Icons.shopping_cart),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.info),
              ),

            ],
          ),
        ),

        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: _isloading ? Center(child: CircularProgressIndicator()) :ListView(
            children: <Widget>[
              Center(
                child: Card(
                  child: _buildStack(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /*TextField(
                      //controller: _nameController,
                      decoration: InputDecoration(
                        //hintText: 'Movie Name'
                      ),
                    ),*/
                    Text(
                      'It',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Terror',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      '⭐ ⭐ ⭐ ⭐',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Year',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              '2020',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Country',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Ecuador',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Length',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              '125 min',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0),
                    Container(
                      height: 120.0,
                      child: SingleChildScrollView(
                        child: Text(
                          ' En el pueblo de Derry, Maine, un niño llamado Bill Denbrough (Jaeden Martell)'
                              ' ayuda a su hermano pequeño, George "Georgie" Denbrough '
                              '(Jackson Robert Scott) a hacer un barco de papel. Bill le pide '
                              'que baje al sótano por parafina para impermeabilizarlo, George baja '
                              'y consigue la parafina para el barco aunque nota allí una presencia '
                              'que lo asusta. Bill, con su hermano abrazándole, unta el barco con '
                              'la parafina y se lo entrega a Georgie para que vaya a jugar en la '
                              'lluvia excusándose de no poder acompañarlo ya que está muy enfermo.',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );

  }
  // #docregion Card
  Widget _buildCard() => SizedBox(
    height: 210,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text('1625 Main Street',
                style: TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text('My City, CA 99984'),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500)),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: Text('costa@example.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),
  );
  /**
   * widget circular
   */
  Widget _buildStack() => Stack(
    alignment: const Alignment(0.6, 0.6),
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset('assets/it.jpg'),
      ),

      Container(
        decoration: BoxDecoration(
          color: Colors.black45,
        ),

      ),
    ],
  );
}




