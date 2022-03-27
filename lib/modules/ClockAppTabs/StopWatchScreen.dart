import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {

  @override
  _StopWatchScreenState createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  var isTimerOn;
  var isReset;
  var stopwatchForamt = "00 : 00 : 00";
  final stopwatchInstant = Stopwatch();
  final Duration _duration = const Duration(seconds: 1);

  @override
  void initState() {
    isTimerOn = false;
    isReset = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(isTimerOn);
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                stopwatchForamt,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  wordSpacing: 2,
                  fontSize: 50,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          if (isTimerOn) {
                            setState(() {
                              isTimerOn = true;
                              stopwatchStarted();
                            });
                          } else {
                            print("else");

                            setState(() {
                              isTimerOn = false;
                              StopWatchPause();
                            });
                            // stopwatchPause();
                          }
                        },
                        shape:  CircleBorder(),
                        color: Colors.blueGrey,
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: isTimerOn != true
                                ?  Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                              size: 70,
                            )
                                : const Icon(
                              Icons.pause_outlined,
                              color: Colors.blueGrey,
                              size: 70,
                            ))),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: isReset ,
                      child: MaterialButton(
                          onPressed: () {
                            StopWatchReset();
                          },
                          shape: CircleBorder(),
                          color: Colors.blueGrey,
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.restart_alt,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void stopwatchStarted() {
    stopwatchInstant.start();
    isTimerOn = true;

    print("stopwatchStarted");
    startTimer();
  }
  void keepRunning() {
    if (stopwatchInstant.isRunning) {
      isReset = false;
      startTimer();
      print("keep it Running");
    }
    setState(() {
      stopwatchForamt = stopwatchInstant.elapsed.inHours
          .toString()
          .padLeft(2, "0") +
          " : " +
          (stopwatchInstant.elapsed.inMinutes % 60)
              .toString()
              .padLeft(2, "0") +
          " : " +
          (stopwatchInstant.elapsed.inSeconds % 60).toString().padLeft(2, "0");
      print(stopwatchForamt);
    });
  }
  void startTimer() {
    Timer(_duration, keepRunning);
    isReset = false;
    print("Timer Started");
  }





  void StopWatchReset() {
    setState(() {
      isReset = true;
      stopwatchInstant.reset();
      stopwatchForamt = "00 : 00 : 00";
    });
  }
  void StopWatchPause() {
    setState(() {
      isTimerOn = false;
      isReset = false;
      stopwatchInstant.stop();
    });
    print("StopWatchPause");
  }
}