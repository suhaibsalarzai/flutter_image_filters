import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_color_filters/filters.dart';
import 'dart:ui' as ui;

class Matrix4Rotation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageFiltered(
                imageFilter: ImageFilter.matrix(
                  Matrix4.rotationZ(0.15).storage,
                ),
                child: Image.asset("assets/images/sample.png", scale: 2.0)),
          ],
        ),
      ),
    );
  }
}
