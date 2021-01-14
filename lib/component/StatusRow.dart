import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class StatusRow extends StatelessWidget {
  StatusRow({this.name, this.value, this.color});

  final name;
  final value;
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              name,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Expanded(
              child: FAProgressBar(
                currentValue: value,
                displayText: '%',
                size: 20,
                progressColor: color,
                backgroundColor: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
