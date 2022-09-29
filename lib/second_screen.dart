import 'dart:typed_data';

import 'package:flutter/material.dart';

class ResultingFilters extends StatelessWidget {
  final Uint8List imageData;

  const ResultingFilters({Key key, this.imageData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('More Editing'),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
            // constraints:
            //     BoxConstraints(maxHeight: size.width, maxWidth: size.width),
            child: Image.memory(
              imageData,
              width: size.width,
              // height: size.height,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'SHARE',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            color: Color(0xFFDCAE96),
            padding: EdgeInsets.only(bottom: 20.0),
            margin: EdgeInsets.only(top: 10.0),
            height: 80.0,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
