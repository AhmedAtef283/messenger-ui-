import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key key}) : super(key: key);

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child:
         Column(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text(
               DateTime.now().hour  > 12 ? "Good Evening" : 'Good Morning' ,
               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
             ),
             SizedBox(height: 10.0,) ,
             Text(
                 DateTime.now().hour > 12 ? '${DateTime.now().hour-12} :${DateTime.now().minute} PM ' : '${DateTime.now().hour-12} :${DateTime.now().minute} AM  ' ,
               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black45),),

         ],)
 );

  }
}
