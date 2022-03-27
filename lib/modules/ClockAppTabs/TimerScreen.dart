import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  final CustomTimerController timerController = CustomTimerController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         body: Column(mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Row(mainAxisAlignment: MainAxisAlignment.center,
               children: [
                  CustomTimer(
                    controller:timerController ,

                     begin:Duration(minutes: 7) ,
                    end: Duration(),
                      builder: (time) {
                        return Text(
                            "${time.hours}:${time.minutes}:${time.seconds}.${time.milliseconds}",
                            style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold
                            )
                        );
                      }




                  )
               ],
             ),
             Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 RaisedButton(
                   onPressed: (){
                     timerController.start();
                   }, color: Colors.green,child: Text('Start'),),

                 RaisedButton(
                   onPressed: (){
                     timerController.pause();
                   }, color: Colors.white60,child: Text('Pause'),),
                 RaisedButton(
                   onPressed: (){
                     timerController.finish();
                   }, color: Colors.red,child: Text('End'),),
               ],

             ),

           ],

         )


    );

  }
}