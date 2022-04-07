import 'package:flutter/material.dart';

class key extends StatelessWidget {
  key({
   required this.data,
   this.fillColor,
    this.textColor,
    this.textSize,
    this.callback,
    });

  String data = '';
  int? fillColor ;
  int? textColor;
  double? textSize;
  Function? callback ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: 
      GestureDetector(
        onTap: () => callback!(data),
        child: Container(
          height: 70, 
          width: 70, 
          decoration: BoxDecoration(color:fillColor == null ? Color(0xFFFFFFFF) : Color(fillColor!),borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(8),
          child: Center(child: Text(data,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold
          ),)),
          ),
      ));
  }
}
