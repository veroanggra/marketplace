import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String numberValue;

  Badge({required this.numberValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, right: 4),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.red),
      child: Text(
        numberValue,
        style: TextStyle(fontSize: 8, color: Colors.white),
      ),
    );
  }
}
