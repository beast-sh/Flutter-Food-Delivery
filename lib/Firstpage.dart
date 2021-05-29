
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodninjabmsce/const/themecolor.dart';
import 'package:foodninjabmsce/Restaurant/rsign_in.dart';


class FirstPage extends StatelessWidget {


  TextStyle _getStyle() {
    return TextStyle(
        fontFamily: 'Arial',
        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.lightBlue);
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(

      // appBar: _appBar(),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Food Ninja',
          style: TextStyle(fontSize: 28),

        ),

        actions: <Widget>[
          Padding(
              padding:EdgeInsets.only(right: 20.0),
              child:GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed('/aboutus');
                },
                child: Icon(
                  Icons.info_rounded,
                  size: 26.0,
                ),
              ) ,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed('/contactus');
              },
              child: Icon(
                Icons.contact_page,
                size: 26.0,
              ),
            ),
          ),
        ],



      ),
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomPadding: false,
      body: Padding(

        padding: EdgeInsets.all(85),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10),
/*
            Text(
              'Food Ninja',
            style: _getStyle(),

            ),*/
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
            Container(
              decoration: BoxDecoration(
                  color: Themes.color,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(blurRadius: 2.0, color: Themes.color)]),
              width: 220,
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.black,
                      ),
                      SizedBox(width: 20.0),
                      Text(
                        'Sign in as User',
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/signin');
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Themes.color,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [BoxShadow(blurRadius: 2.0, color: Themes.color)]),
              width: 245,
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.restaurant,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Sign in as Restaurant',
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/rsign_in');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
