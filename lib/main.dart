import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_layout/news_layout.dart';
import 'package:news_app/shared/bloc_observer/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/cache_helper.dart';
import 'package:news_app/shared/network/dio_helper.dart';

void main() async {
  // insure that every method in the main finished then start running
  // the app 'because the main in origin doesn't Async'
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.ini();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> NewsCubit()..getBusiness()..getScience()..getSports()..getAll()),
        BlocProvider(create: (context)=>AppCubit()..changeAppTheme( fromShared: isDark )),
        BlocProvider(create: (context)=>SearchCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (BuildContext context, state) {
          return MaterialApp(
            theme: ThemeData(
                textTheme:  TextTheme(
                    bodyLarge: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
                primarySwatch: Colors.grey,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme:  AppBarTheme(
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
                floatingActionButtonTheme:  FloatingActionButtonThemeData(
                    backgroundColor: Colors.black),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.grey[400],
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.black,
                )),
            darkTheme: ThemeData(
                textTheme:  TextTheme(
                    bodyLarge: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
                scaffoldBackgroundColor: Colors.black45,
                floatingActionButtonTheme:  FloatingActionButtonThemeData(
                    backgroundColor: Colors.white),
                appBarTheme:  AppBarTheme(
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
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home://Categoryscreen(),
             NewsLayout(),
          );
        },
      ),
    );
  }
}
