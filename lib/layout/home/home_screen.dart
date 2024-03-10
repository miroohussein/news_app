import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../module/web_view/web_view.dart';
import '../../shared/components/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class NewsHomeScreen extends StatelessWidget {
  const NewsHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).totalData;
        return state is! NewsGetTotalDataLoadingState
            ? Padding(
              padding:  EdgeInsets.all(16.0),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Container(
                    height: 224.0,
                    width: 389.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WebViewScreen(list[1]['url'])));
                      },
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            child: Image.network(
                              list[1]['urlToImage'].toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color:  Color(0xFFFFFFFF).withOpacity(0.5),
                          ),
                          Text(
                            '${list[1]['title']}',
                            style:  TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 20.0,
                  ),
                  Container(

                    child:  Text(
                      "Trending..",
                      style:
                          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                   SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return buildArticleItem(list[index], context);
                        },
                        separatorBuilder: (context, index) {
                          return separatedLine(context);
                        },
                        itemCount: NewsCubit.get(context).totalData.length),
                  ),
                ]),
            )
            :  Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
