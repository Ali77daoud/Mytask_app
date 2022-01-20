import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/bloc/tasks_bloc/tasks_states.dart';
import 'package:test/pages/archive.dart';
import 'package:test/pages/done.dart';
import 'package:test/pages/taskbody.dart';

class TaskCubit extends Cubit<TaskStates>{
  TaskCubit() : super(InitialState());
  static TaskCubit get(context)=>BlocProvider.of(context);
  int i = 0;
  List<Map> tasks=[];
  List<bool> ifopened = [];
  bool ifshown = false;
  IconData ic = Icons.edit;
  late Database database;
  List<Widget> screens = [
    TaskBody(),
    DonePage(),
    ArchivePage(),
  ];
 

  void changeindex(int index){
    i=index;
    emit(ChangeNavigationBarState());
  }

  
  void openbottomsheet(){
    ifshown=true;
    ic=Icons.add;
    emit(OpenBottomsheet());
  }
  void closebottomsheet(){
    ifshown=false;
    ic=Icons.edit;
    emit(CloseBottomsheet());
  }
  void opendetailscontainer(int index){
    ifopened[index] = !ifopened[index];
    emit(ShowDetails());
  }

  void createDatabase()async{
     database = await openDatabase(
    'todo.db',
    version: 1,
    //create and open data baser
    onCreate:(database,version)
    {
      print('databse created');
      database.execute('CREATE TABLE task(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value) =>
       print('table created')).catchError((error){
         print('error when creating table${error}'
         );
    }, );
    },
    onOpen:(database)
    {
      emit(CreatDB());
      print('database opened');
      getDataFromDB(database);
    },
  );
    
  }

Future insertToDatabase({required String title,required String date,required String time}) async{
  await database.transaction((txn) async {
    txn.rawInsert('INSERT INTO task(title,date,time,status) VALUES("$title","$date","$time","new")').
    then((value) 
    {
      print('$value inserted suc');
      emit(InsertToDB());
      getDataFromDB(database);
     
      }
    ).catchError(
      (error){print('error when insert new value $error');}
      );
  });
}
void updatedatabase({required String status,required int id})async{
  database.rawUpdate(
    'UPDATE task SET status = ? WHERE id=?',
    ['$status',id],
  ).then((value) {
    emit(UbdateDB());
  });
}

void getDataFromDB(database){
  emit(ShowProgressInicator());
  database.rawQuery('SELECT * FROM task').then((value){
    tasks = value;
    print('get value');
    for(int i=0;i<tasks.length;i++){
      ifopened.add(false);
    }
    print(ifopened.length);
    emit(GetFromDB());
  });
  
}

}