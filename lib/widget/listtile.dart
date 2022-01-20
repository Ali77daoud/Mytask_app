import 'package:flutter/material.dart';

Widget DefaultListTile({required Map tasks}){
  
  return ListTile(
    title: Text(tasks['title']) ,
    subtitle: Text(tasks['date']),
    leading: CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 25,
      child: Text(tasks['time'],style: TextStyle(fontSize: 10),overflow: TextOverflow.ellipsis,),
    ),
    trailing: Text('la'),
    

  );
}