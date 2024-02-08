import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class ScinceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var list = NewsCubit.get(context).science;
          return state is! NewsGetScienceLoadingState
              ? ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildArticleItem(list[index],context);
              },
              separatorBuilder: (context, index) {
                return separatedLine(context);
              },
              itemCount: NewsCubit.get(context).science.length)
              : Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (context, state) {});
  }
}
