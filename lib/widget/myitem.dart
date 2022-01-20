import 'package:flutter/material.dart';
import 'package:test/bloc/tasks_bloc/task_cubit.dart';

// class MyItem extends StatefulWidget {
//   const MyItem({ Key? key }) : super(key: key);

//   @override
//   _MyItemState createState() => _MyItemState();
// }

// class _MyItemState extends State<MyItem> {
//   bool ifshow = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('welcom'),
      
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 150,
            
//               child: Stack(
//                 children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 60,top: 10,bottom: 10,right: 10),
//                   child: InkWell(
//                     onTap: (){
//                       setState(() {
//                         ifshow = !ifshow;
//                       });
                     
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                         begin: Alignment.topRight,
//                         end: Alignment.bottomLeft,
//                         colors: [
//                           Color.fromRGBO(0, 102, 102,1),
//                           Color.fromRGBO(96, 0, 128,150),
//                         ],
                        
//                       ),
//                       // color: Color.fromRGBO(179, 128, 255,1),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 20,left: 45,right:40 ),
//                           child: Container(
//                             width:  double.infinity,
//                             height: 35,
//                             child: Text('jsndkjsndkjnkjnkjnkjknkjkjnjk',maxLines: 1,style: TextStyle(fontSize: 18,color:Colors.white,overflow: TextOverflow.ellipsis),),
//                           ),
//                         ),
//                         SizedBox(height: 5,),
//                          Padding(
//                            padding: const EdgeInsets.only(left: 45,right:40 ),
//                            child: Container(
//                             width:  double.infinity,
//                             height: 20,
//                             child: Text('20-10-2020',maxLines: 1,style: TextStyle(fontSize: 15,color:Colors.white,overflow: TextOverflow.ellipsis),),
//                         ),
//                          ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               IconButton(
//                                 onPressed: (){
                  
//                                 },
//                                 icon: Icon(Icons.archive,size: 30,color: Colors.grey.shade300,))
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     ),
//                   ),
//                 ),
//                  Padding(
//                    padding: const EdgeInsets.only(top:25.0),
//                    child: CircleAvatar(
//                     backgroundColor: Color.fromRGBO(0, 102, 102,1),
//                     radius: 50,
//                     child: Text('2:20 PM',style: TextStyle(fontSize: 20,color:Colors.white),),
//                 ),
//                  ),
//               ],
//               ),
//             ),
//             ifshow==true?
//             Padding(
//               padding: const EdgeInsets.only(left: 20),
//               child: Container(
//                 width: double.infinity,
//                 height: 100,
//                 decoration: BoxDecoration(
//                       color: Color.fromRGBO(96, 0, 128,100),
//                       borderRadius: BorderRadius.circular(30),
//                     ), 
//                 child: Column(
//                   children: [
//                     Text('Description',style: TextStyle(fontSize: 18,color:Colors.black,fontWeight: FontWeight.bold),),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10,right: 10,top:3),
//                       child: Container(
//                         width: double.infinity,
//                         height:70,
//                         // color: Colors.red,
//                         child: Text('mlkmlkmllkklsmdlskmdlskmdlskdm',maxLines: 3,style: TextStyle(fontSize: 15,color:Colors.white,overflow: TextOverflow.ellipsis),),
//                       ),
//                     ),
//                   ],
//                 )
//               ),
//             ):Container(),
//           ],
//         ),
//       )
//     );
//   }
// }

Widget MyItem({required Map tasks,required context,required int ind}){
  return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              // color: Colors.red,
              child: Stack(
                children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60,top: 10,bottom: 10,right: 10),
                  child: InkWell(
                    onTap: (){
                      TaskCubit.get(context).opendetailscontainer(ind);
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(0, 102, 102,1),
                          Color.fromRGBO(96, 0, 128,150),
                        ],
                        
                      ),
                      // color: Color.fromRGBO(179, 128, 255,1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 45,right:40 ),
                          child: Container(
                            width:  double.infinity,
                            height: 35,
                            child: Text(tasks['title'],maxLines: 1,style: TextStyle(fontSize: 18,color:Colors.white,overflow: TextOverflow.ellipsis),),
                          ),
                        ),
                        SizedBox(height: 5,),
                         Padding(
                           padding: const EdgeInsets.only(left: 45,right:40 ),
                           child: Container(
                            width:  double.infinity,
                            height: 20,
                            child: Text(tasks['date'],maxLines: 1,style: TextStyle(fontSize: 15,color:Colors.white,overflow: TextOverflow.ellipsis),),
                        ),
                         ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: (){
                  
                                },
                                icon: Icon(Icons.archive,size: 30,color: Colors.grey.shade300,))
                            ],
                          ),
                        ),
                      ],
                    ),
                    ),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(top:25.0),
                   child: CircleAvatar(
                    backgroundColor: Color.fromRGBO(0, 102, 102,1),
                    radius: 50,
                    child: Text(tasks['time'],style: TextStyle(fontSize: 20,color:Colors.white),),
                ),
                 ),
              ],
              ),
            ),
            TaskCubit.get(context).ifopened[ind]==true?
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 5),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 102, 102,1),
                      borderRadius: BorderRadius.circular(20),
                    ), 
                child: Column(
                  
                  children: [
                    Text('Description',style: TextStyle(fontSize: 15,color:Colors.white,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top:3),
                      child: Container(
                        width: double.infinity,
                        height:70,
                        // color: Colors.red,
                        child: Text('you have to go to Gym',maxLines: 3,style: TextStyle(fontSize: 15,color:Colors.grey.shade300,overflow: TextOverflow.ellipsis),),
                      ),
                    ),
                  ],
                )
              ),
            ):Container(),
          ],
        ),
      );
}