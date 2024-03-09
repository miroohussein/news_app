import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/module/search/search.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/dio_helper.dart';

import '../../shared/components/component.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen()));
                },
                    icon:Icon(Icons.search)
                ),
                IconButton(
                  icon: AppCubit.get(context).icon,
                  onPressed: (){
                   AppCubit.get(context).changeAppTheme();
                    },
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
            //body: cubit.screens[cubit.currentindex],
            body: cubit.mainScreens[cubit.currentindex],
            // floatingActionButton: Container(
            //   width: 50.0,
            //   height: 50.0,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10.0),
            //     color: Colors.black
            //   ),
            //   child: FloatingActionButton(
            //     onPressed: (){
            //
            //     },
            //     child: Icon(
            //       Icons.add
            //     ),
            //   ),
            // ),
          );
        },
        listener: (BuildContext context, Object? state) {},
    );
  }
}
