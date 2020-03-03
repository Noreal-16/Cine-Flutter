import 'package:carousel_pro/carousel_pro.dart';
import 'package:cineloj_v1/Views/list_movies.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
                backgroundImage: AssetImage('assets/login_icon.png',
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/movie.jpg'),
                    ),
                    title: Text('Peliculas'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieList()));
                    },
                  ),
                ),
                SizedBox(height: 8.0),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('Item 2'),
                    onTap: (){

                    },
                  ),
                )
              ],

            ),

          ],
        ),

      ),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        title: Text('CineLoj'),
        actions: <Widget>[
          InkWell(
            child: Icon(Icons.search),
            onTap: (){
              print('object');
            },
          ),
          InkWell(
            child: Icon(Icons.more_vert),
            onTap: (){
              print('object 2');
            },
          ),
        ],
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
            child: Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0,),
                  title: Text('Ejemplo texto 1'),
                  subtitle: Text('Aqui va el cuerpo'),
                )
            ),
          ),
        ],
        //child:
      ),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
       onPressed: (){
          clickedCenterFAB = !clickedCenterFAB;
        },
        tooltip: "Center",
       child: Container(
         margin: EdgeInsets.all(15.0),
         child: Icon(Icons.add),
       ),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              IconButton(
              //update the bottom app bar view each time an item is clicked
              onPressed: () {
        //updateTabSelection(0, "Home");
        },
          iconSize: 27.0,
          icon: Icon(
            Icons.home,
            //darken the icon if it is selected or else give it a different color

          ),
          ),
        ]
        ),
    ),

      ),*/
    );
  }
}