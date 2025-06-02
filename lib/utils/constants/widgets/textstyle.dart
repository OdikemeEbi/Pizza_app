import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle text18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: Colors.black
  );
   static const TextStyle text24 = TextStyle
   (fontSize:24, fontWeight: FontWeight.w600, 
   color: Colors.black);

    static const TextStyle text11 = TextStyle(
      fontSize: 11, fontWeight: FontWeight.w300, 
      color: Colors.black);
      
      static const TextStyle text14 = TextStyle(
        fontSize: 14, fontWeight: 
        FontWeight.w600, color: Colors.black);
}

TextStyle text18(Color color){
  return  TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: color
  );
}


