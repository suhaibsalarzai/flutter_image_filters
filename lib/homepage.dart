import 'package:flutter/material.dart';
import 'package:flutter_color_filters/editing.dart';
import 'package:flutter_color_filters/filtering.dart';
import 'reusablecard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _select createState() => _select();
}

class _select extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFDCAE96),
      child: Column(
        children: [
          Spacer(),
          Text(
            "Select an image to edit",
            style: Theme.of(context).textTheme.headline4,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  cardChild: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Text(
                      'Filtering',
                      style: Theme.of(context).textTheme.headline4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Filtering()),
                    );
                  },
                ),
              ),
              Expanded(
                  child: ReusableCard(
                cardChild: Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Text(
                    'Editing',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                colour: Color(0xFF1D1E33),
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => editing()),
                  );
                },
              ))
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
            child: Container(
              child: Text(
                "Select image, and edit them easily in a matter of seconds. Save or share them wherever and whenever you want.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
