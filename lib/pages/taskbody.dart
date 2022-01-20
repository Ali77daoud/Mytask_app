import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/tasks_bloc/task_cubit.dart';
import 'package:test/bloc/tasks_bloc/tasks_states.dart';
import 'package:test/widget/myitem.dart';

class TaskBody extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit,TaskStates>(
      listener: (context,state){},
      builder:(context,state){
        return ListView.separated(
          itemBuilder: (context,index)=>MyItem(tasks:TaskCubit.get(context).tasks[index],context: context,ind: index), 
          separatorBuilder:(context,index)=>Divider(thickness: 2,) , 
          itemCount: TaskCubit.get(context).tasks.length,
          );
      },
      
    );
  }
}