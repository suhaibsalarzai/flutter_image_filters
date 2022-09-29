import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color_filters/filters.dart';
import 'dart:ui' as ui;
import 'package:flutter_color_filters/second_screen.dart';

class Filtering extends StatefulWidget {
  @override
  _FilteringState createState() => _FilteringState();
}

class _FilteringState extends State<Filtering> {
  final GlobalKey _globalKey = GlobalKey();
  final List<List<double>> filters = [
    SWEET_MATRIX,
    CYAN_MATRIX,
    MAGENTA_MATRIX,
    COLD_MATRIX,
    VINTAGE_MATRIX,
    SEPIA_MATRIX,
    GREYSCALE_MATRIX,
  ];

  void convertToImage() async {
    RenderRepaintBoundary repaintBoundary =
        _globalKey.currentContext.findRenderObject();
    ui.Image boxImage = await repaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8list = byteData.buffer.asUint8List();
    Navigator.of(_globalKey.currentContext).push(MaterialPageRoute(
        builder: (context) => ResultingFilters(
              imageData: uint8list,
            )));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Image image = new Image.asset(
      "assets/images/sample.png",
      width: size.width,
      fit: BoxFit.cover,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Swipe left for more Filters",
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: RepaintBoundary(
                key: _globalKey,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: size.width,
                    maxHeight: size.width,
                  ),
                  child: PageView.builder(
                      itemCount: filters.length,
                      itemBuilder: (context, index) {
                        return ColorFiltered(
                          colorFilter: ColorFilter.matrix(filters[index]),
                          child: image,
                        );
                      }),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              convertToImage();
            },
            child: Container(
              child: Center(
                child: Text(
                  'Confirm',
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
          ),
        ],
      ),
    );
  }
}
