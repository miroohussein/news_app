import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SpotrsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var list = NewsCubit.get(context).sports;
          return state is! NewsGetSportsLoadingState
              ? ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildArticleItem(list[index]);
              },
              separatorBuilder: (context, index) {
                return separatedLine();
              },
              itemCount: NewsCubit.get(context).sports.length)
              : Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (context, state) {});
  }
}
