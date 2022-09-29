import 'dart:ui';

import 'package:flutter/material.dart';

import 'Matrix4Rotation.dart';

class editing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('IMAGE Processing in Flutter')),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'Transform Image',
                  style: TextStyle(color: Colors.black),
                ),
                color: Color(0xFFDCAE96),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(13),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                child: Text(
                  'IMAGE BLUR',
                  style: TextStyle(color: Colors.black),
                ),
                color: Color(0xFFDCAE96),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Container(
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image:
                              new ExactAssetImage('assets/images/sample.png'),
                        ),
                      ),
                      child: new BackdropFilter(
                        filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white.withOpacity(0.0)),
                        ),
                      ),
                    ),
                  ));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(13),
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                child: Text(
                  'IMAGE Rotation',
                  style: TextStyle(color: Colors.black),
                ),
                color: Color(0xFFDCAE96),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Matrix4Rotation()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding: EdgeInsets.all(13),
              ),
            ],
          ),
        )),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFFDCAE96),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    );
  }
}
