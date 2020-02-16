import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CineHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('CineLoj',
        style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: <Widget>[
            ImageCarousel(),
            _BuildCards(),
           // _button()
          ],
        ),
      )

    );

  }
  
 /**
   * Witget de boton
   */
  Widget _button (){
    return Center(
       child: Padding(
            padding: EdgeInsets.all(100.0),
            child: SizedBox.fromSize(
              size: Size(56, 56), // button width and height
              child: ClipOval(
                child: Material(
                  color: Colors.lightBlue, // button color
                  child: InkWell(
                    splashColor: Colors.green, // splash color
                    onTap: () {}, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.shopping_cart), // icon
                        Text("Reserv"), // text
                      ],
                    ),
                  ),
                ),
              ),
            )
       ),
    );
  }
  Widget _BuildCards(){
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: Icon(Icons.local_movies),
                title: Text('Ejemplo de Texto'),
                subtitle: Text('Este es el Subtitulo'),

              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Reserver Ticket'),
                    onPressed: (){

                    },
                  ),
                  FlatButton(
                    child:  const Text('Lista'),
                    onPressed: (){

                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    
  }
}






//metodo para agregar el carrusel de las imagenes
class ImageCarousel extends StatelessWidget{
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



//witget del carrucel
  @override
  Widget build(BuildContext context) {
    double screemHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        height: screemHeight/2,
        child: new ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            children: <Widget>[
              carousel,
              banner(),
            ],
          )
        ),
      ),
    );
  }


}

//witget del banner interno
class banner extends StatefulWidget {
  @override
  _bannerState createState() => _bannerState();
}

class _bannerState extends State<banner> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 18.0).animate(controller)..addListener(()
    {setState(() {

    });
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0),
        child: new Container(
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0)
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Text('Las mejores peliculas en estreno',
            style: TextStyle(
                fontFamily: 'fonts/Fira_Sans',
                fontSize: animation.value//18.0
            ),),
        )
    );

  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

