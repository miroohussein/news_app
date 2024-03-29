// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
//
// import '../cubit/cubit.dart';
//
//
// Widget defultButton(
//         {double width = double.infinity,
//         Color color = Colors.brown,
//         required Function()? function,
//         required String text}) =>
//     Container(
//       width: width,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         color: color,
//       ),
//       child: MaterialButton(
//         onPressed: function,
//         child: Text(
//           text.toUpperCase(),
//           style: TextStyle(fontSize: 17.0, color: Colors.white),
//         ),
//       ),
//     );
//
// Widget defaultFormFeild({
//   required TextEditingController controller,
//   required TextInputType textInputType,
//   required String? validate(String? value),
//   required String text,
//   required IconData icon,
//   Function()? onTap,
//   bool isPassword = false,
//   IconData? suffics,
//   bool isClickable = true,
// // IconData visibleOass = Icons.videocam_off_outlined,
//   Function()? function,
// }) =>
//     TextFormField(
//       controller: controller,
//       obscureText: isPassword,
//       keyboardType: textInputType,
//       onFieldSubmitted: (String value) {
//         print(value);
//       },
// // onChanged: (value) {
// //   print(value);
// // },
//       enabled: isClickable,
//       validator: validate,
//       onTap: onTap,
//       decoration: InputDecoration(
//         labelText: text,
//         prefixIcon: Icon(icon),
//         suffixIcon: IconButton(
//           icon: Icon(suffics != null ? suffics : null),
//           onPressed: function,
//         ),
//         border: OutlineInputBorder(),
//       ),
//     );
//
// Widget taskItemBuilder(Map model, context) {
//   return Dismissible(
//   key: Key(model['id'].toString()),
//     onDismissed: (direction){
//       AppCubit.get(context).deleteFromDatabase(id: model['id']);
// },
//     child: Padding(
//       padding: const EdgeInsets.all(15.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 40.0,
//             backgroundColor: Colors.blueAccent,
//             child: Text(
//               '${model['id']}',
//               style: TextStyle(color: Colors.white, fontSize: 30.0),
//             ),
//           ),
//           SizedBox(
//             width: 12.0,
//           ),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${model['Task']}',
//                   style: TextStyle(
//                       fontSize: 25.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//                 SizedBox(
//                   height: 12.0,
//                 ),
//                 Text(
//                   '${model['Date']}',
//                   style: TextStyle(fontSize: 18.0, color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             padding: EdgeInsets.all(18.0),
//             onPressed: () {
//               AppCubit.get(context).updateDatabase(note: 'done', id: model['id']);
//             },
//             icon: Icon(Icons.task_alt),
//             color: Colors.greenAccent,
//           ),
//           SizedBox(
//             width: 5.0,
//           ),
//           IconButton(
//             padding: EdgeInsets.all(18.0),
//             onPressed: () {
//               AppCubit.get(context)
//                   .updateDatabase(note: 'archive', id: model['id']);
//             },
//             icon: Icon(Icons.archive_outlined),
//             color: Colors.blueAccent,
//           ),
//         ],
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:news_app/module/web_view/web_view.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget buildArticleItem(article , context){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewScreen(article['url'])));
    },
    child: Padding(
      padding:  EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image:DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                )
            ),
          ),
           SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${article['title']}",
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyLarge ,),
                  Text('${article['publishedAt']}',
                    style:  TextStyle(
                      fontSize: 18.0,
                      color: Colors.grey,

                    ),),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget separatedLine(context){
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 8.0),
    child: Container(
        color: AppCubit.get(context).isDark? Colors.grey[900]:Colors.grey[300],
        height: 2.0,
        width: double.infinity),
  );
}

