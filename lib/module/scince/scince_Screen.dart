import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var list = NewsCubit.get(context).science;
          return state is! NewsGetScienceLoadingState
              ? Scaffold(
            appBar: AppBar(
              title: Text(
                'Science',
              ),
              actions: [
                IconButton(
                  icon: AppCubit.get(context).icon,
                  onPressed: (){
                    AppCubit.get(context).changeAppTheme();
                  },
                ),
              ],
            ),
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildArticleItem(list[index],context);
                  },
                  separatorBuilder: (context, index) {
                    return separatedLine(context);
                  },
                  itemCount: NewsCubit.get(context).science.length),
                ),
              )
              : Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (context, state) {});
  }
}
