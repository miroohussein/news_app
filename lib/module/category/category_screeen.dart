import 'package:flutter/material.dart';
import 'package:news_app/module/business/business_screen.dart';
import 'package:news_app/module/scince/scince_Screen.dart';
import 'package:news_app/module/sports/sports_screen.dart';

class Categoryscreen extends StatelessWidget {
  const Categoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0,4),
                          ),]
                        ),
                        child:ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            elevation:MaterialStateProperty.all(0.0),
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const BusinessScreen()),
                            );
                          },
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Icon(
                                  Icons.business_outlined,
                                  color: Colors.black,
                                  size: 36.0,
                                ),
                               SizedBox(height:5.0),
                               Text(
                                  'Buseiness',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ),

                      ),
                      const SizedBox(width: 50.0,),
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: const Offset(0,4),
                          ),]
                        ),
                        child:ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            elevation:MaterialStateProperty.all(0.0),
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  const ScienceScreen()),
                            );
                          },
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Icon(
                                  Icons.science,
                                  color: Colors.black,
                                  size: 36.0,
                                ),
                               SizedBox(height:5.0),
                               Text(
                                  'Science',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height:30.0),
                  Row(
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset:  Offset(0,4),
                            ),]
                        ),
                        child:ElevatedButton(

                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            elevation:MaterialStateProperty.all(0.0),
                          ),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  SportsScreen()),
                            );
                          },
                          child:  Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Icon(
                                  Icons.sports_basketball,
                                  color: Colors.black,
                                  size: 36.0,
                                ),
                                SizedBox(height:5.0),
                                Text(
                                  'Sports',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ),

                      ),
                      const SizedBox(width: 50.0,),
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0,4),
                            ),]
                        ),
                        child:ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            elevation:MaterialStateProperty.all(0.0),
                          ),
                          onPressed: (){},
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Icon(
                                  Icons.brush_sharp,
                                  color: Colors.black,
                                  size: 36.0,
                                ),
                                SizedBox(height:5.0),
                                Text(
                                  'Beauty',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height:30.0),
                  Row(
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0,4),
                            ),]
                        ),
                        child:ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            elevation:MaterialStateProperty.all(0.0),
                          ),
                          onPressed: (){},
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Icon(
                                  Icons.music_note,
                                  color: Colors.black,
                                  size: 36.0,
                                ),
                                SizedBox(height:5.0),
                                Text(
                                  'Art & Music',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ),

                      ),
                      const SizedBox(width: 50.0,),
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0,4),
                            ),]
                        ),
                        child:ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            elevation:MaterialStateProperty.all(0.0),
                          ),
                          onPressed: (){},
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Icon(
                                  Icons.movie_filter,
                                  color: Colors.black,
                                  size: 36.0,
                                ),
                                SizedBox(height:5.0),
                                Text(
                                  'Movies',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ),

                      ),
                    ],
                  ),
                  const SizedBox(height:30.0),
                  Row(
                    children: [
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0,4),
                            ),]
                        ),
                        child:ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            elevation:MaterialStateProperty.all(0.0),
                          ),
                          onPressed: (){},
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Icon(
                                  Icons.laptop,
                                  color: Colors.black,
                                  size: 36.0,
                                ),
                                SizedBox(height:5.0),
                                Text(
                                  'Technology',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ),

                      ),
                      const SizedBox(width: 50.0,),
                      Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: const Offset(0,4),
                            ),]
                        ),
                        child:ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                            elevation:MaterialStateProperty.all(0.0),
                          ),
                          onPressed: (){},
                          child: const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Icon(
                                  Icons.blender,
                                  color: Colors.black,
                                  size: 36.0,
                                ),
                                SizedBox(height:5.0),
                                Text(
                                  'Cooking',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
