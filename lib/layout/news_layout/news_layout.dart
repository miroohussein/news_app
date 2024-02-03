import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){},
                    icon:Icon(Icons.search)
                ),
              ],
              title: Text('JAREEDAH'),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItem,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },

            ),
            body: cubit.screens[cubit.currentindex],
            floatingActionButton: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black
              ),
              child: FloatingActionButton(
                onPressed: (){
                  DioHelper.gtData(url:'v2/top-headlines',
                      query: {
                    'country':'eg',
                    'category':'business',
                    'apiKey':'bb828cd18aeb42f5afb50e816a05215f',
                      },).then((value) {
                        print(value.toString());
                  }).catchError((error){
                    print(error.toString());
                  });
                },
                child: Icon(
                  Icons.add
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
