import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:med_care/theme/theme_data.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

  @override void initState(){
    Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {
        
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 350,
      height: 350,
      child: Transform.rotate(
        angle: -pi/2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}


class ClockPainter extends CustomPainter{
  var dateTime = DateTime.now();

  //60 sec -> 360/60 =6 degree
  @override
  void paint(Canvas canvas,Size size){
    var centerX = size.width/2;
    var centerY = size.height/2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX,centerY);

    //define paintbrushes
    var fillBrush = Paint()
    ..color=Color(0xFF444974);

    var outLineBrush = Paint()
    ..color=Color(0xFFEAECFF)
    ..strokeWidth=16
    ..style=PaintingStyle.stroke;


    var innerBrush = Paint()
    ..color=Color(0xFFEAECFF);


    var secHandBrush = Paint()
      ..color = CustomColors.secHandColor!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    var minHandBrush = Paint()
      ..shader = RadialGradient(colors: [CustomColors.minHandStatColor, CustomColors.minHandEndColor])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round 
      ..strokeWidth = size.width / 30;

    var hourHandBrush = Paint()
      ..shader = RadialGradient(colors: [CustomColors.hourHandStatColor, CustomColors.hourHandEndColor])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 24;
    

    var dashBrush = Paint()
      ..color = CustomColors.clockOutline
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    //drawing from the brushess
    //clock drawing
    canvas.drawCircle(center,radius-40,fillBrush);
    canvas.drawCircle(center,radius-40,outLineBrush);

    //drawing hands

    var hourHandX = centerX+ 60* cos(dateTime.hour*0.5 * pi/180);
    var hourHandY = centerX+ 60* sin(dateTime.hour*0.5 * pi/180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX+ 80* cos(dateTime.minute * 6 * pi/180);
    var minHandY = centerX+ 80* sin(dateTime.minute * 6 * pi/180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);


    var secHandX = centerX+ 80* cos(dateTime.second *6 * pi/180);
    var secHandY = centerX+ 80* sin(dateTime.second *6* pi/180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);


    canvas.drawCircle(center,16,innerBrush);

    var outerRadius = radius;
    var innerRadius = radius-14;
    for(double i=0;i<360;i+=12){
      var x1 = centerX + outerRadius * cos(i * pi / 180);
      var y1 = centerY + outerRadius * sin(i * pi / 180);

      var x2 = centerX + innerRadius * cos(i * pi / 180);
      var y2 = centerY + innerRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}