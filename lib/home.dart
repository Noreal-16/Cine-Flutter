import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CineHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Carousel',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Carousel Demo'),
        ),
        body: _body(),
      ),
    );
  }

  Widget _body (){
    return Stack(
        children: <Widget>[
          new PageView(
            children: [testBGCarousel()],
          ),
          new ListView(
            children: [
              new Text('This text displays on top of the carousel'),
            ],
          ),
        ]
    );
  }

  Widget testBGCarousel(){
    return CarouselSlider(
      height: 400.0,
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber
                ),
                child: Text('text $i', style: TextStyle(fontSize: 16.0),)
            );
          },
        );
      }).toList(),
    );
  }
}

