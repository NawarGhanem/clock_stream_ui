import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  Clock({Key? key}) : super(key: key);
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  double minutesAngle = 0;
  double secondsAngle = 0;
  double hoursAngle = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      final now = DateTime.now();
      print(now);
      setState(() {
        secondsAngle = (pi / 30) * now.second;
        minutesAngle = pi / 30 * now.minute;
        hoursAngle = (pi / 6 * now.hour) + (pi / 45 * minutesAngle);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(132, 170, 193, 1),
      child: Container(
        // Clock
        width: 370,
        height: 370,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
        ),
        // Clock
        child: Stack(
          children: <Widget>[
            Image.asset('assets/2001.png'),

            //Seconds
            Transform.rotate(
              angle: secondsAngle,
              child: Container(
                alignment: Alignment(0, -0.35),
                child: Container(
                  height: 140,
                  width: 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            //Minuts
            Transform.rotate(
                angle: minutesAngle,
                child: Container(
                  alignment: Alignment(0, -0.35),
                  child: Container(
                    height: 95,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )),
            //Hours
            Transform.rotate(
              angle: hoursAngle,
              child: Container(
                alignment: Alignment(0, -0.2),
                child: Container(
                  height: 70,
                  width: 6,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            //Dot
            Container(
              alignment: Alignment(0, 0),
              child: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
