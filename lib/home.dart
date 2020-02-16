import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class CineHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MyBodyPage();
  }
}
/**
 * Clase body para crear listas
 */
class MyBodyPage extends StatefulWidget{
  @override
  StateMyBodyPage createState() => StateMyBodyPage();

}

class StateMyBodyPage extends State<MyBodyPage>{
  ScrollController _controller;
  double bakgroundHeight = 180.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        centerTitle: false,
      ),
      body: _body(),
    );
  }
    Widget _body(){
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: bakgroundHeight,
          color: Colors.grey,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0 ),
          child: ListView(
            controller: _controller,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0,bottom: 16.0),

              ),
              ImageCarousel(),
              _BuildCards(),
              _Item('Marvel', 'assets/imagen.jpg'),
              _Item('Huason', 'assets/peli1.jpg'),
              _Item('Quin Poemix', 'assets/peli2.jpg'),

            ],
          ),
        )

      ],
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
/**
 * Items para llamar imagenes
 */
  Widget _Item(String name, String imagenes){

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              //para que se vaya a la derecha las imagenes Expanded
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        //container para hacer circulo en la izquierda de la imagen
                        Container(
                          width: 42.0,
                          height: 42.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21.0),
                              color: Color(0xff363cb0)
                          ),
                          child: Center(
                            child: Text(
                              //texto va aser la primera letra del nombre
                              name[0],
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 18.0),
                        Text(name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 18.0),
                    Text('Symbol desing system tutorial - Part 1'),
                    Text('Discover  things of this world'),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Icon(Icons.shopping_cart),

                          onPressed: (){

                          },
                        ),
                      ],
                    )

                  ],
                ),

              ),
              SizedBox(width: 16.0),
              Container(
                width: 120.0,
                height: 120.0,
                child: Image(
                  image: AssetImage(imagenes),
                  fit: BoxFit.cover,
                ),
              ),

            ],
          ),
        )

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

