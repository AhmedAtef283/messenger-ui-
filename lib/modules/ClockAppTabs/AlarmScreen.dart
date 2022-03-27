import 'package:conditional_builder/conditional_builder.dart';
import 'package:first_app/defults/Components.dart';
import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key key}) : super(key: key) ;


  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}


class _AlarmScreenState extends State<AlarmScreen> {
  String date ;
  String time ;
  List  datelist = [] ;
  List  timelist = [] ;
  void addToList() {
    datelist.add(date);
    timelist.add(time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
      FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){


         ShowDate().then((value) {
            setState(() {
              date = value ;
            });



           ShowTime().then((value) {
          setState(() {
         time = value ;
        });
       });





            });

             },
             backgroundColor: Colors.blueGrey),

          body:  ConditionalBuilder(
                        condition: timelist!= 0 ,
                         builder:(context ) =>  ListView.separated(
                            itemBuilder: (context, index){
                       return AlarmBuilder(datelist[index],timelist[index]);
                                 },
                separatorBuilder:(context, index){SizedBox(height: 10.0,); } ,
                itemCount: timelist.length) ,
                        fallback: (context ) => null ,
          )  );
  }


  Future ShowTime() async
  {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    var localizations = MaterialLocalizations.of(context);
    localizations.formatTimeOfDay(time).toString();

    print(time);


  }

  Future ShowDate() async
  {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2025),
    );
    print(date);
    return date.toString().substring(0, 10);
  }





}
