import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home/home_screen.dart';
import 'package:news_app/layout/news_layout/news_layout.dart';
import 'package:news_app/module/business/business_screen.dart';
import 'package:news_app/shared/bloc_observer/bloc_observer.dart';
import 'package:news_app/shared/network/dio_helper.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
            color: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.dark),
            elevation: 0.0,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.black
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey[400],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
          )),

      darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black45,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.white
          ),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
            color: Colors.black45,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.black45,
                statusBarBrightness: Brightness.light),
            elevation: 0.0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.grey[600],
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
          )),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: NewsLayout(),
    );
  }
}
