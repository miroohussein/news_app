 abstract class AppStates{}
class AppInitialState extends AppStates{}
 class AppThemeChangeState extends AppStates{}
// class AppChangeBottomNavBarState extends AppStates{}
// class AppCreateDatabaseState extends AppStates{}
// class AppGetDatabaseState extends AppStates{}
// class AppGetDatabaseLoadingState extends AppStates{}
// class AppInsertToDatabaseState extends AppStates{}
// class AppUpdateToDatabaseState extends AppStates{}
// class AppDeleteFromDatabaseState extends AppStates{}
// class AppChangeBottomSheetState extends AppStates{}
abstract class NewsStates{}
class NewsinitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class ChangeScreensState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}

class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final String errorSpors;
  NewsGetSportsErrorState(this.errorSpors);
}
class NewsGetSportsLoadingState extends NewsStates{}

class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
  final String errorScience;
  NewsGetScienceErrorState(this.errorScience);
}
class NewsGetScienceLoadingState extends NewsStates{}