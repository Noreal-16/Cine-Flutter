import 'package:cineloj_v1/Views/list_movies.dart';
import 'package:cineloj_v1/pages/checkoutPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';

const CardFoot = Color(0xFF9FA8DA);
class TicketDetalle extends StatefulWidget {
  @override
  _TicketDetalleState createState() => _TicketDetalleState();
}

class _TicketDetalleState extends State<TicketDetalle> {
  PageController _controller;
  int currentPage = 9;


  @override
  void initState() {
    super.initState();

    _controller = PageController(
      initialPage: currentPage,
      viewportFraction: 0.4,
    );
  }

  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieList()));
      },
    );
  }
  Widget _bottomAction1(IconData icon) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CineHome()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar: BottomAppBar(
        color: CardFoot,
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //_bottomAction(FontAwesomeIcons.history),
            _bottomAction1(FontAwesomeIcons.home),
            SizedBox(width: 48.0),
            _bottomAction(Icons.movie),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutPage()));
        },
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          //_selector(),
          _expenses(),
          _graph(),
          Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 24.0,
          ),
          _list(),

          /*_item(FontAwesomeIcons.shoppingCart, "Shopping", 14, 145.12),
          _item(FontAwesomeIcons.city, "Cantidad", 15, 145.12),*/
        ],
      ),
    );
  }

  Widget _pageItem(String name, int position) {
    var _alignment;
    final selected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    );
    final unselected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.blueGrey.withOpacity(0.4),
    );

    if (position == currentPage) {
      _alignment = Alignment.center;
    } else if (position > currentPage) {
      _alignment = Alignment.centerRight;
    } else {
      _alignment = Alignment.centerLeft;
    }

    return Align(
      alignment: _alignment,
      child: Text(name,
        style: position == currentPage ? selected : unselected,
      ),
    );
  }

  Widget _expenses() {
    return Column(
      children: <Widget>[
        Text("\$95.2",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
        Text("Total Price",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        ),
      ],
    );
  }

  Widget _graph() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        //height: 250.0,
        child: Image.asset('assets/it.jpg', ),
      ),
    );
  }

  Widget _item(IconData icon, String name, int percent, double value) {
    return ListTile(
      leading: Icon(icon, size: 32.0,),
      title: Text(name,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
        ),
      ),
      subtitle: Text("$percent% of discount",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.blueGrey,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("\$$value",
            style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: ListView(
        children: <Widget>[
          _function(),
          _item(Icons.monetization_on, "Price", 15, 75.0),
          _item(Icons.monetization_on, "Subagregate", 15, 10.0),
          _item(Icons.monetization_on, "Iva", 15, 10.2),
          _item(Icons.attach_money, "Fullprice", 15, 95.2),

        ],
      ),
    );
  }
}

Widget _function(){
  return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            elevation: 0.0,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.movie,size: 30, color: Colors.black,),
                  title: Text('It', style: TextStyle(fontSize: 22 , color: Colors.blueAccent),),
                  subtitle: Text('Fecha: 2020-03-15 hora: 2:22:3', style: TextStyle(color: Colors.black),),
                ),
                ListTile(
                  leading: Icon(Icons.info,size: 30, color: Colors.black,),
                  title: Text('Sala # 3', style: TextStyle(fontSize: 22 , color: Colors.black),),
                  //subtitle: Text('Lenguaje: Espaniol', style: TextStyle(fontSize: 22,color: Colors.black),),
                ),
              ],
            ),
          ),

        ],
      )
  );
}

