
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_rev/shared/style/colors.dart';

 ThemeData  lightTheme = ThemeData(
   primarySwatch: defaultColor,
   scaffoldBackgroundColor: Colors.white,
   appBarTheme: AppBarTheme(
     systemOverlayStyle: SystemUiOverlayStyle(
       statusBarColor: Colors.white,
       statusBarIconBrightness: Brightness.dark,
     ),
     backgroundColor: Colors.white,
     elevation: 10.0,
     actionsIconTheme: IconThemeData(
       color: Colors.black,
       size: 30.0
     ),
     iconTheme: IconThemeData(
       color: Colors.black
     ),
     titleTextStyle: TextStyle(
       fontSize: 18.0,
       fontWeight: FontWeight.bold,
       color: Colors.black
     ),
     titleSpacing: 20.0,
   ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     elevation: 20.0,
     backgroundColor: Colors.white,
     unselectedItemColor: Colors.grey,
     selectedItemColor: defaultColor,
     type: BottomNavigationBarType.fixed,

   ),
   textTheme: TextTheme(
     bodyText1: TextStyle(
       fontSize: 18.0,
       fontWeight: FontWeight.w600,
       color: Colors.black
     )
   ),
 );

 ThemeData darkTheme = ThemeData(
   primaryTextTheme: TextTheme(
     bodyText1: TextStyle(
       fontSize: 18.0,
       fontWeight: FontWeight.w600,
       color: Colors.white
     )
   ),
   primarySwatch: defaultColor,
   scaffoldBackgroundColor: HexColor('333739'),
   appBarTheme: AppBarTheme(
     systemOverlayStyle: SystemUiOverlayStyle(
       statusBarIconBrightness: Brightness.light,
       statusBarColor: HexColor('333739')
     ),
     backgroundColor: HexColor('333739'),
     elevation: 10.0,
     titleTextStyle: TextStyle(
       fontSize: 18.0,
       fontWeight: FontWeight.bold,
     ),
     titleSpacing: 20.0,
     actionsIconTheme: IconThemeData(
       color: Colors.white
     ),
     iconTheme: IconThemeData(
       color: Colors.white
     ),
   ),
   textTheme: TextTheme(
     bodyText1: TextStyle(
       fontSize: 18.0,
       fontWeight: FontWeight.w600,
       color: Colors.white
     ),
   ),
   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     elevation: 20.0,
     backgroundColor: HexColor('333739'),
     type: BottomNavigationBarType.fixed,
     selectedItemColor: defaultColor,
     unselectedItemColor: Colors.grey,
   ),
   
 );