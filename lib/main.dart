import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'dart:math';
import 'package:flutter_compass/flutter_compass.dart';

main()=> runApp(Controles());
class Controles extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Estado();
  }
}
class Estado extends State{

  AccelerometerEvent acelerometro;
  GyroscopeEvent giroscopio;
  double _direccion;

    @override
  void initState(){
    super.initState();
    FlutterCompass.events.listen((double direccion){
        setState(() {
          _direccion=direccion;

        });
      });
    accelerometerEvents.listen((AccelerometerEvent event){
      setState(() {
          acelerometro=event;

          
        });
      });
  }





  final txtControlNombre = TextEditingController();
  String nombre;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('brujula')
        ),
        body:new Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: new Transform.rotate(
            angle: (acelerometro.y),
            child: new Image.asset('assets/brujula.png'),
          ),
        )
        
      ),
    );
  }


}