import 'package:flutter/material.dart';

import 'home.dart';

const AppbarColor = Color(0xFF303F9F);

class ListMovie{
  String id;
  String Name;
  DateTime DatePremiere;


  ListMovie({this.id,this.Name,this.DatePremiere,});

}

class ReservationMovie extends StatelessWidget {


  final movie = [
    new ListMovie(
        id: "1",
        Name: "It",
        DatePremiere: DateTime.now()

    ),
    new ListMovie(
        id: "2",
        Name: "Avengers",
        DatePremiere: DateTime.now()

    ),
    new ListMovie(
        id: "3",
        Name: "Scooby Doo",
        DatePremiere: DateTime.now()

    ),


  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppbarColor,
          elevation: 0.0,
          title: Text('List of notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CineHome()));
        },
        child: Icon(Icons.home),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 280/2,
            color: AppbarColor,

          ),
          _serviceReserva(context)
        ],
      )
    );
  }
  Widget _serviceReserva(context){
    return ListView.separated(
      separatorBuilder: (_, __) => Divider(height: 1, color: Colors.transparent),
      itemBuilder: (_, index) {
        return Dismissible(
          key: ValueKey(movie[index].id),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
          },
          confirmDismiss: (direction) async {
            final result = await showDialog(
                context: context,
                builder: (_) => NoteDelete()
            );
            print(result);
            return result;
          },
          background: Container(
            color: Colors.red,
            padding: EdgeInsets.only(left: 16),
            child: Align(child: Icon(Icons.delete, color: Colors.white), alignment: Alignment.centerLeft,),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.movie),
                title: Text(
                  movie[index].Name,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text('Last edited on ${formatDateTime(movie[index].DatePremiere)}'),
                trailing: Icon(Icons.shopping_cart, color: Colors.green,),
                onTap: () {
                },
              ),
            ),
          ),
        );
      },
      itemCount: movie.length,
    );
  }
}

class NoteDelete extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure you want to delete this note?'),
      actions: <Widget>[
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
          child: Text('No'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
      ],
    );
  }
}