import 'package:flutter/material.dart';

import 'home.dart';

const AppbarColor = Color(0xFF303F9F);

class ListMovie{
  String id;
  String Name;
  DateTime DatePremiere;


  ListMovie({this.id,this.Name,this.DatePremiere,});

}

class FormularioUsuario extends StatelessWidget {




  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
            backgroundColor: AppbarColor,
            elevation: 0.0,
            title: Text('Datos de Usuario')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CineHome()));
          },
          child: Icon(Icons.home),
        ),
         body: Column(
           children: <Widget>[
             SizedBox(height: 30.0),
             Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: <Widget>[
                     Image.asset('assets/registro.png'),
                     SizedBox(height: 13.0),
                     titleSection,
                     buttonSection,

                   ],
                 )
             ),
           ],
           //child:
         ),
    );
  }

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
            Center(
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Alex  Nole ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    ],
  ),
);

