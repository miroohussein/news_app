import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../../shared/components/component.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = SearchCubit.get(context).search;
    var searchController = TextEditingController();
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<SearchCubit, SearchStates>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextFormField(
                    onChanged: (value) {
                      SearchCubit.get(context).getSearch(value);
                      print(value.toString());
                      print(list);
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
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return buildArticleItem(list[index], context);
                      },
                      separatorBuilder: (context, index) {
                        return separatedLine(context);
                      },
                      itemCount: list.length),
                )
                // Expanded(child: buildArticleItem(list , context)),
              ],
            );
          },
        ),
      ),
    );
  }
}
