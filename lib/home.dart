import 'package:flutter/material.dart';
import 'dart:math';


//colores a reutilizar
const swatch_1 = Color(0xff91a1b4);
const swatch_2 = Color(0xffe3e6f3);
const swatch_3 = Color(0xffbabdd2);
const swatch_4 = Color(0xff545c6b);
const swatch_5 = Color(0xff363cb0);
const swatch_6 = Color(0xff09090a);
const swatch_7 = Color(0xff25255b);

class HomeCinemas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return HomeCine(title: 'CineLoj',);
  }

}

class HomeCine extends StatefulWidget {
  HomeCine({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeCine> {
  ScrollController _controller;
  double bakgroundHeight = 180.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        bakgroundHeight = max(
            0,
            180.0 - _controller.offset
        );
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //es el encabezado de la aplicacion
      appBar: AppBar(
        //para que el la presentacion del appbar sea transparente
        backgroundColor: swatch_3.withOpacity(0.5),
        elevation: 0.0,
        centerTitle: false,
        //para poner el texto en un estilo con color negro
        title: Padding(
          //padding para que haya una separacion del titulo
          padding: EdgeInsets.only(left: 32.0),

          child: Text('CineLoj',style: TextStyle(color: swatch_6)),
        ),

        //icono de la aplicacion dentro del appbar
        actions: <Widget>[
          //para que haya una separacion
          Padding(
              padding: EdgeInsets.only(right: 32.0),
              child: InkWell(
                child: Icon(
                  Icons.share,
                  //se llama al color antes asignado
                  color: swatch_1,
                ),
              )),
        ],
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
          color: swatch_3.withOpacity(0.5),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 32.0),
          child: ListView(
            controller: _controller,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
                child: Text("Modificar esta parte"),
              ),

             //TODO aqui va el cuerpo de la aplicacion list

            ],
          ),
        )
      ],
    );


  }
}

