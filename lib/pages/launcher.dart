import 'package:flutter/material.dart';
import 'package:test/layout/bottom_navigation_bar.dart';

class MyTask extends StatefulWidget {
  const MyTask({ Key? key }) : super(key: key);

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomBar())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(0, 102, 102,1),
                          Color.fromRGBO(96, 0, 128,150),
                        ],
                        
                      ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:120,right: 120),
              child: Container(
                width:double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/my_task.png'),
                    fit: BoxFit.cover,)
            ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}