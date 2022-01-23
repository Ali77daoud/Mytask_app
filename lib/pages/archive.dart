import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/tasks_bloc/task_cubit.dart';
import 'package:test/bloc/tasks_bloc/tasks_states.dart';
import 'package:test/widget/myitem.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<TaskCubit,TaskStates>(
      listener: (context,state){},
      builder:(context,state){
        return TaskCubit.get(context).arch.isEmpty?Container(child: Center(child: Text('Empty')),): 
        ListView.separated(
          itemBuilder: (context,index)=>MyItem(tasks:TaskCubit.get(context).arch[index],context: context,ind: index,ifopened:TaskCubit.get(context).ifopenedarch), 
          separatorBuilder:(context,index)=>Divider(thickness: 2,) , 
          itemCount: TaskCubit.get(context).arch.length,
          );
      },
      
    );
  }
}