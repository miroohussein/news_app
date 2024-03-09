import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../../shared/components/component.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var article = NewsCubit.get(context).search;
    var searchController = TextEditingController();

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context ,state){},
      builder:(context , state)=> Scaffold(
        appBar:AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: (value){
                NewsCubit.get(context).getSearch(value);
                },
                  controller: searchController,
                decoration: InputDecoration(
                  label: Text(
                    'Search',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  prefix: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          //  SizedBox(height: 10.0,),
         // Expanded(child: buildArticleItem(article , context)),
          ],
        ),
      ),
    );
  }
}
