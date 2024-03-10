import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          var list = NewsCubit.get(context).sports;
          return state is! NewsGetSportsLoadingState
              ? Scaffold(
            appBar: AppBar(
              title: const Text(
                'Sports',
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
                body: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildArticleItem(list[index],context);
                  },
                  separatorBuilder: (context, index) {
                    return separatedLine(context);
                  },
                  itemCount: NewsCubit.get(context).sports.length),
                ),
              )
              : const Center(
            child: CircularProgressIndicator(),
          );
        },
        listener: (context, state) {});
  }
}
