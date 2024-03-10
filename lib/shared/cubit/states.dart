abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppThemeChangeState extends AppStates {}
/////

// class AppChangeBottomSheetState extends AppStates{}
abstract class SearchStates {}
class SearchInitialState extends SearchStates{}
class NewsGetSearchSuccessState extends SearchStates {}

class NewsGetSearchErrorState extends SearchStates {
  final String errorSearch;

  NewsGetSearchErrorState(this.errorSearch);
}

class NewsGetSearchLoadingState extends SearchStates {}
// class AppChangeBottomNavBarState extends AppStates{}
// class AppCreateDatabaseState extends AppStates{}
// class AppGetDatabaseState extends AppStates{}
// class AppGetDatabaseLoadingState extends AppStates{}
// class AppInsertToDatabaseState extends AppStates{}
// class AppUpdateToDatabaseState extends AppStates{}
// class AppDeleteFromDatabaseState extends AppStates{}
// class AppChangeBottomSheetState extends AppStates{}
abstract class NewsStates {}

class NewsinitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class ChangeScreensState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetTotalDataLoadingState extends NewsStates {}

class NewsGetTotalDataSuccessState extends NewsStates {}

class NewsGetTotalDataErrorState extends NewsStates {
  final String errorTotalData;

  NewsGetTotalDataErrorState(this.errorTotalData);
}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String errorSpors;

  NewsGetSportsErrorState(this.errorSpors);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String errorScience;

  NewsGetScienceErrorState(this.errorScience);
}

class NewsGetScienceLoadingState extends NewsStates {}


// class NewsGetSearchSuccessState extends NewsStates {}
//
// class NewsGetSearchErrorState extends NewsStates {
//   final String errorSearch;
//
//   NewsGetSearchErrorState(this.errorSearch);
// }
//
// class NewsGetSearchLoadingState extends NewsStates {}