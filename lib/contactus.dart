import 'package:flutter/material.dart';
import 'package:foodninjabmsce/const/themecolor.dart';



class contactus extends StatelessWidget{
  TextStyle _getStyle() {
    return TextStyle(
        fontSize: 26, fontWeight: FontWeight.bold, color: Themes.color);
  }
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
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
                  'B.M.S College Of Engineering',
                  style: _getStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Icon(
                        Icons.phone,
                        size: 30,
                        color: Themes.color,
                      ),
                    ),
                    Text(
                      ': 8756439856',
                      style: _getStyle(),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      size: 30,
                      color: Themes.color,
                    ),
                    Text(
                      ' : foodninja@bmsce.ac.in',
                      style: _getStyle(),
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

