import 'package:flutter/material.dart';
import 'package:news_app/shared/cubit/cubit.dart';

import '../../shared/components/component.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List article = NewsCubit.get(context).search;
    return Scaffold(
      appBar:AppBar(),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: TextFormField(

                ),
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          buildArticleItem(article , context),
        ],
      ),
    );
  }
}
