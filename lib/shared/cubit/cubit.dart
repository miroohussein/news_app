// import 'dart:ui';
//
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sqflite/sqflite.dart';
// // import '../../module/archive_screen.dart';
// // import '../../module/done_tasks_screen.dart';
// // import '../../module/tasks_screen.dart';
// import '../components/consts.dart';
// import 'states.dart';
//
// class AppCubit extends Cubit<AppStates> {
//   AppCubit() : super(AppInitialState());
//
//   static AppCubit get(context) => BlocProvider.of(context);
//  // List<Widget> screens = [TasksScreen(), DoneTasksScreen(), ArchiveScreen()];
//
//   int currentIndex = 0;
//
//   List<String> appBarTiltle = [
//     'Tasks',
//     'Done Tasks',
//     'Archive',
//   ];
//
//   bool showSheetBar = false;
//   IconData icon = Icons.edit;
//   late Database database;
//   List<Map> newTasks = [];
//   List<Map> tasks = [];
//   List<Map> doneTasks = [];
//   List<Map> archiveTasks = [];
//   int index = 0;
//
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(AppChangeBottomNavBarState());
//   }
//
//   void onCreateDataBase() {
//     openDatabase('todo.db', version: 1, onCreate: (database, version) async {
//       print("databace created");
//       await database.execute(
//           'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, Task TEXT, Date TEXT, Note TEXT)');
//       print("table created");
//     }, onOpen: (database) {
//       getDataFromDatabase(database);
//       print("database Opened");
//     }).then((value) {
//       database = value;
//       emit(AppCreateDatabaseState());
//     });
//   }
//
// ///////////////////////////////////////////////////////////////
//   insertToDataBase({required title, required date, required time}) async {
//     await database.transaction((txn) {
//       return txn
//           .rawInsert(
//               'INSERT INTO Tasks(Task, Date, Note, Time) VALUES("$title", "$date","New","$time")')
//           .then((value) {
//         print('Inserted $value');
//         emit(AppInsertToDatabaseState());
//         getDataFromDatabase(database);
//       }).catchError((error) {
//         print('error while inserting ${error.toString()}');
//       });
//     });
//   }
//
//   // database.transaction((txn) {
//   //   txn.rawInsert('INSERT INTO Tasks(Task, Date, Note) VALUES("first Task","12-5","done")').then((value){
//   //     print('$value Inserted successfully');
//   //   }).catchError((error){
//   //     print('Error when inserting new record ${error.toString()}');
//   //   });
//   //   return null;
//   // });
//   void getDataFromDatabase(database) {
//     newTasks = [];
//     doneTasks = [];
//     archiveTasks = [];
//
//     emit(AppGetDatabaseLoadingState());
//     database.rawQuery('SELECT * FROM Tasks').then((value) {
//       value.forEach((element) {
//         if (element['Note'] == 'archive')
//           archiveTasks.add(element);
//         else if (element['Note'] == 'done')
//           doneTasks.add(element);
//         else
//           newTasks.add(element);
//       });
//       tasks = value;
//       print(tasks);
//       emit(AppGetDatabaseState());
//     });
//   }
//
//   void updateDatabase({required String note, required int id}) async {
//     await database.rawUpdate(
//         'UPDATE Tasks SET Note = ? WHERE id = ?', ['$note', id]).then((value) {
//       getDataFromDatabase(database);
//       emit(AppUpdateToDatabaseState());
//     });
//   }
//
//   void deleteFromDatabase({ required int id}) async {
//     await database.rawDelete('DELETE FROM Tasks WHERE id = ?', [id]).then((value) {
//       getDataFromDatabase(database);
//       emit(AppDeleteFromDatabaseState());
//     });
//   }
//
//   void changeBottomSheeStste(
//       {required bool isShow, required IconData icondata}) {
//     showSheetBar = isShow;
//     icon = icondata;
//     emit(AppChangeBottomSheetState());
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home/home_screen.dart';
import 'package:news_app/module/bookmark/bookmark_screen.dart';
import 'package:news_app/module/business/business_screen.dart';
import 'package:news_app/module/category/category_screeen.dart';
import 'package:news_app/module/profile/profile_screen.dart';
import 'package:news_app/module/scince/scince_Screen.dart';
import 'package:news_app/module/settings/settings_screens.dart';
import 'package:news_app/module/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/cache_helper.dart';

import '../network/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsinitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

/*  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      label: 'Business',
      icon: Icon(
        Icons.business,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Sports',
      icon: Icon(
        Icons.sports_baseball,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Scince',
      icon: Icon(
        Icons.science,
      ),
    ),
    BottomNavigationBarItem(
      label: 'Settings',
      icon: Icon(
        Icons.settings,
      ),
    ),
  ];*/

  List<BottomNavigationBarItem> bottomItem = [
     BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home,
      ),
    ),
     BottomNavigationBarItem(
      label: 'Category',
      icon: Icon(
        Icons.category,
      ),
    ),
     BottomNavigationBarItem(
      label: 'Bookmark',
      icon: Icon(
        Icons.bookmarks_rounded,
      ),
    ),
     BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(
        Icons.person_3_rounded,
      ),
    ),
  ];
  List<Widget> screens = [
     BusinessScreen(),
     SportsScreen(),
     ScienceScreen(),
     SettingsScreen(),
  ];
  List<Widget> mainScreens = [
     NewsHomeScreen(),
     Categoryscreen(),
     BookmarkScreen(),
     ProfileScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentindex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  // List<dynamic> search = [];
  List<dynamic> totalData = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.gtData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'bb828cd18aeb42f5afb50e816a05215f',
      },
    ).then((value) {
      print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.gtData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'bb828cd18aeb42f5afb50e816a05215f',
      },
    ).then((value) {
      print(value.data['articles'][0]['title']);
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.gtData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'bb828cd18aeb42f5afb50e816a05215f',
      },
    ).then((value) {
      print(value.data['articles'][0]['title']);
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  // void getSearch(String value) {
  //   emit(NewsGetSearchLoadingState());
  //   DioHelper.gtData(url: 'v2/everything', query: {
  //     'q': value,
  //     'apiKey': 'bb828cd18aeb42f5afb50e816a05215f',
  //   }).then((value) {
  //     search = value.data['articles'];
  //     print(search[0]['title']);
  //     emit(NewsGetSearchSuccessState());
  //   }).catchError((onError) {
  //     print(onError.toString());
  //     emit(NewsGetSearchErrorState(onError));
  //   });
  // }

  void getAll() {
    emit(NewsGetTotalDataLoadingState());
    DioHelper.gtData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'apiKey': 'bb828cd18aeb42f5afb50e816a05215f',
      },
    ).then((value) {
      print(value.data['articles'][0]['title']);
      totalData = value.data['articles'];
      print(totalData[0]['title']);
      emit(NewsGetTotalDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetTotalDataErrorState(error.toString()));
    });
  }
}

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  var icon = const Icon(Icons.brightness_2_outlined);

  void changeAppTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.putData(key: 'isDark', value: isDark)
        .then((value) => emit(AppThemeChangeState()));
  }
}



class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());
  List<dynamic> search = [];
  static SearchCubit get(context) => BlocProvider.of(context);

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.gtData(url: 'v2/everything', query: {
      'q': "$value",
      'apiKey': 'bb828cd18aeb42f5afb50e816a05215f',
    }).then((value) {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetSearchErrorState(onError));
    });
  }
  }

