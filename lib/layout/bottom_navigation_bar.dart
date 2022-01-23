import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test/bloc/tasks_bloc/task_cubit.dart';
import 'package:test/bloc/tasks_bloc/tasks_states.dart';
import 'package:test/widget/defaultextfeild.dart';
import 'package:test/widget/gradient_appbar.dart';

class BottomBar extends StatelessWidget {
  dynamic scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController titleco = TextEditingController();
  TextEditingController timeco = TextEditingController();
  TextEditingController dateco = TextEditingController();
  TextInputType type = TextInputType.emailAddress;
  String l = 'Task Title';
  FocusNode myfocusnode = new FocusNode();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>TaskCubit()..createDatabase(),
      
      child: BlocConsumer<TaskCubit,TaskStates>(
        listener: (context,state){
          if (state is InsertToDB) {
            Navigator.pop(context);
          }
        },
        builder: (context,state){
          var c = TaskCubit.get(context);
          return  Scaffold(
          backgroundColor: Colors.grey.shade300,
          key: scaffoldkey,
          appBar:PreferredSize(
          child: GradientAppBar(
              title:'My Task',
              titlecolor: Colors.white,
              titlesize: 20,
              firstcolor: Color.fromRGBO(0, 102, 102,1),
              secondcolor:  Color.fromRGBO(96, 0, 128,150),
              ),
            preferredSize: new Size(
              MediaQuery.of(context).size.width,
              150.0
            ),
          ),
          body: state is ShowProgressInicator?Center(child: CircularProgressIndicator()):c.screens[c.i],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey.shade300,
            selectedItemColor:Color.fromRGBO(0, 102, 102,1),
            currentIndex: c.i,
            onTap: (index){
              c.changeindex(index);
            },
            items: [
              BottomNavigationBarItem(icon:Icon(Icons.task_alt),label: 'Task' ),
              BottomNavigationBarItem(icon:Icon(Icons.mood_rounded),label: 'Done' ),
              BottomNavigationBarItem(icon:Icon(Icons.archive_rounded),label: 'Archive' ),
            ],
          ),
          
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: FloatingActionButton(
              foregroundColor: Colors.grey.shade300,
              backgroundColor: Color.fromRGBO(0, 102, 102,1),
              onPressed: (){
                if (c.ifshown){
                  if(formkey.currentState!.validate()){
                    c.insertToDatabase(title: titleco.text, date: dateco.text, time: timeco.text);
                  }
                }
                else{
                scaffoldkey.currentState!.showBottomSheet(
                  (context) => Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key:formkey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefualTextFormFeild(
                              controller:titleco,input_type:type,label:l,prifixicon:Icon(Icons.task_alt,color: Color.fromRGBO(0, 102, 102,1),),
                              validate: (value){
                                if(value.isEmpty){
                                  return "PLZ insert the title";
                                }
                              },
                              ontab: (){
                                print('ontab');
                              }
                               ),
                            SizedBox(height: 10,),
                            DefualTextFormFeild(controller: timeco, input_type: TextInputType.none, 
                            validate: (value){
                               if(value.isEmpty){
                                  return "PLZ insert the time";
                                }
                            },
                             label: 'Task Time', prifixicon:  Icon(Icons.watch_later_outlined,color: Color.fromRGBO(0, 102, 102,1),),
                             ontab: (){
                               showTimePicker(
                                 context: context,
                                 initialTime: TimeOfDay.now(),
                                 builder:(context, child) => Theme(
                                data: ThemeData().copyWith(
                                  colorScheme: ColorScheme.highContrastDark(
                                    primary: Color.fromRGBO(0, 102, 102,1),
                                    onBackground: Colors.white,
                                    onPrimary: Colors.grey,
                                    surface: Colors.grey,
                                    onSurface: Colors.black,
                                  ),
                                ),
                                child: child!),
                                 ).then((value){
                                   timeco.text=value!.format(context).toString();
                                   print(value.format(context));
                                   }
                                   );
                             }),
                             SizedBox(height: 10,),
                             DefualTextFormFeild(controller: dateco, input_type: TextInputType.none,
                              validate: (value){
                                 if(value.isEmpty){
                                  return "PLZ insert the date";
                                }
                              },
                               label: 'Task Date', prifixicon: Icon(Icons.date_range_outlined,color:Color.fromRGBO(0, 102, 102,1),),
                              ontab:()
                              {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(), 
                                  firstDate:DateTime(2020), 
                                  lastDate: DateTime(2024),
                                  builder: (context, child) => Theme(
                                    data: ThemeData().copyWith(
                                      colorScheme: ColorScheme.dark(
                                      primary:Color.fromRGBO(0, 102, 102,1),
                                      onPrimary:Colors.grey,
                                      surface: Color.fromRGBO(0, 102, 102,1),
                                      onSurface: Colors.black,
                                  ),
                                      dialogBackgroundColor: Colors.grey.shade400,
                                    ),
                                  child: child!),
                              ).then((value) {
                                dateco.text = (DateFormat.yMMMd().format(value!)).toString();
                              })
                              ;}
                             ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ).closed.then((value) { 
                    c.closebottomsheet() ;
                  });

                 c.openbottomsheet();
                  
                  }
              },
              child: Icon(c.ic),
            
              ),
          ),
          
        );
        },
       
      ),
    );
  }
   
}