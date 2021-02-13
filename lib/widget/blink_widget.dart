import 'package:flutter/material.dart';

Widget blinkWidget(Animation animation, String label, bool isBlink) =>
    AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                label,
                style: TextStyle(
                  color:
                      isBlink ? animation.value : Color.fromRGBO(39, 39, 37, 1),
                ),
              ),
            ),
          );
        });
