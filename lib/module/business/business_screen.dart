import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/components/component.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var list = NewsCubit.get(context).business;
          return state is! NewsGetBusinessLoadingState
              ? ListView.separated(
            physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildArticleItem(list[index],context);
                  },
                  separatorBuilder: (context, index) {
                    return separatedLine(context);
                  },
                  itemCount: NewsCubit.get(context).business.length)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
        listener: (context, state) {});
  }
}
