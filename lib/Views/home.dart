import 'package:carousel_pro/carousel_pro.dart';
import 'package:cineloj_v1/Views/list_movies.dart';
import 'package:cineloj_v1/Views/user.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'Reservas.dart';

class CineHome extends StatelessWidget{
  double bakgroundHeight = 300.0;
  //se puede agregar un withget a una variable
  final carousel = Carousel(
    boxFit: BoxFit.cover,
    images: [
      AssetImage('assets/imagen.jpg'),
      AssetImage('assets/peli1.jpg'),
      AssetImage('assets/peli2.jpg'),

    ],
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 2000),
  );
  bool clickedCenterFAB = false;
  @override
  Widget build(BuildContext context) {
    const String _kGalleryAssetsPackage = 'flutter_gallery_assets';
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, '099999999'),
          _buildButtonColumn(color, Icons.email, 'alex.nole@unl.edu.ec'),
         // _buildButtonColumn(color, Icons.share, 'SHARE'),

        ],
      ),
    );
    return Scaffold(
      drawerDragStartBehavior: DragStartBehavior.down,
      drawer: Drawer(
        child:ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('ALEX NOLE'),
              accountEmail: const Text('alex.nole@unl.edu.ec'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/registro.png',
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.person, color: Colors.blueAccent,),
                    title: Text('Perfil'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> FormularioUsuario()));

                    },
                  ),
                ),
                SizedBox(height: 8.0,),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.movie, color: Colors.redAccent,),
                    title: Text('Peliculas'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieList()));
                    },
                  ),
                ),
                SizedBox(height: 8.0),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart,color: Colors.green,),
                    title: Text('Compras'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ReservationMovie()));

                    },
                  ),
                ),
                SizedBox(height: 8.0),

              ],

            ),

          ],
        ),

      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Text('CineLoj'),
        /*actions: <Widget>[
          InkWell(
            child: Icon(Icons.search),
            onTap: (){
              print('object');
            },
          ),
          InkWell(
            child: Icon(Icons.more_vert),
            onTap: (){

            },
          ),
        ],*/
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: bakgroundHeight,
            color: Colors.grey,
            child: Container(
              padding: EdgeInsets.all(20.0),
              height: 180/2,
              child: new ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Stack(
                    children: <Widget>[
                      carousel,
                    ],
                  )
              ),
            ),
          ),
          SizedBox(height: 30.0),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  titleSection,
                  buttonSection,
                  textSection
                ],
              )
          ),
        ],
        //child:
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}



Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'CineLoj ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
              ),
            ),
            Text(
              'La mejor opción al momento de reservar una película',
              style: TextStyle(
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('41'),
    ],
  ),
);

Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Esta aplicación está diseñada para reservar películas en cines de la ciudad de Loja, somos estudiantes de la Universidad Nacional de Loja en busca de una solución y para facilitar la reserva de una película de interés.',
    softWrap: true,
  ),
);