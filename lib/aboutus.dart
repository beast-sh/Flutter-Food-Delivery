import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodninjabmsce/const/themecolor.dart';



class aboutus extends StatelessWidget{
  TextStyle _getStyle() {
    return TextStyle(
        fontFamily: 'Arial',
        fontSize: 18, fontWeight: FontWeight.bold, color: Themes.color);
  }
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
         child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(

                width: deviceSize.width/2,
                height: deviceSize.height/3,
                padding: EdgeInsets.all(150),

                decoration: new BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(

                    image: new AssetImage(
                      'assets/icon.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Divider(
                height: 20,
              ),
              Text(
                'Welcome To BMS College of Engineering. Our main aim is to serve Food to you online.'
                  'This application allows you to order or pre Book the meal you want to eat. '
                    'We are hoping to digitalize the entire canteen traditional System. ',
                  style: _getStyle(),
                textAlign: TextAlign.center,


              ),



            ],


      ),
      ),
      ),
    );
  }

}

