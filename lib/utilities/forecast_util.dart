import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util{
  static String getFormateDate(DateTime dateTime){
    return DateFormat('EEE,MMM d, y').format(dateTime);
  }
  static GetItem(IconData iconData, int value, String units) {
    return
      Column(
        children: <Widget>[
          Icon(iconData, color: Colors.black, size: 28),
          SizedBox(height: 20,),
          Text('$value', style: TextStyle(fontSize: 20, color: Colors.black),),
          SizedBox(height: 20,),
          Text('$units', style: TextStyle(fontSize: 20, color: Colors.black),),
        ],
      );
  }
    static GetDoubleItem(IconData iconData, double? value, String units){
      return
        Column(
          children: <Widget>[
            Icon(iconData, color: Colors.black, size: 28),
            SizedBox(height: 20,),
            Text('$value',style: TextStyle(fontSize: 20,color: Colors.black),),
            SizedBox(height: 20,),
            Text('$units',style: TextStyle(fontSize: 20,color: Colors.black),),
          ],
        );
    
  }
}