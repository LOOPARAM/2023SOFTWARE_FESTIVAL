import 'package:sensors/sensors.dart';
import 'package:flutter/material.dart';

class GetSensors extends StatefulWidget {

  @override
  State<GetSensors> createState() => _GetSensorsState();
}
class _GetSensorsState extends State<GetSensors> {
  double _accelerometerX = 0.0;
  double _accelerometerY = 0.0;
  double _accelerometerZ = 0.0;

  double _gyroscopeX = 0.0;
  double _gyroscopeY = 0.0;
  double _gyroscopeZ = 0.0;

  double _gravityX = 0.0;
  double _gravityY = 0.0;
  double _gravityZ = 0.0;

  String stop_direction = "none";

  double before_AcclerometerX = 0.0;
  double before_AcclerometerY = 0.0;
  double before_AcclerometerZ = 0.0;

  double deltaX = 0.0;
  double deltaY = 0.0;
  double deltaZ = 0.0;

  double count = 0;

  @override
  void initState() {

    // 가속도 센서 데이터 구독
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        before_AcclerometerX = _accelerometerX;
        before_AcclerometerX = _accelerometerY;
        before_AcclerometerX = _accelerometerZ;

        _accelerometerX = event.x;
        _accelerometerY = event.y;
        _accelerometerZ = event.z;

        deltaX = _accelerometerX - before_AcclerometerX;
        deltaY = _accelerometerY - before_AcclerometerX;
        deltaZ = _accelerometerZ - before_AcclerometerZ;

        if(_accelerometerX.abs() > 7){
          stop_direction = "Horizontal";
        }
        if(_accelerometerY.abs() > 7){
          stop_direction = "Vertical";
        }
        if(_accelerometerZ.abs() > 7){
          stop_direction = "Lied";
        }

      });
    });

    // 자이로 센서 데이터 구독
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeX = event.x;
        _gyroscopeY = event.y;
        _gyroscopeZ = event.z;
      });
    });

    // 중력 센서 데이터 구독
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _gravityX = event.x;
        _gravityY = event.y;
        _gravityZ = event.z;
      });
    });
    setState(() {

    });

    count+=1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Accelerometer:'),
        Text('X: $_accelerometerX'),
        Text('Y: $_accelerometerY'),
        Text('Z: $_accelerometerZ'),
        SizedBox(height: 20),
        Text('Gyroscope:'),
        Text('X: $_gyroscopeX'),
        Text('Y: $_gyroscopeY'),
        Text('Z: $_gyroscopeZ'),
        SizedBox(height: 20),
        Text('Gravity:'),
        Text('X: $_gravityX'),
        Text('Y: $_gravityY'),
        Text('Z: $_gravityZ'),
        SizedBox(height: 20),
        Text('stop_direction: $stop_direction'),
        SizedBox(height: 20),
        // Text('DeltaAccelerometer:'),
        // Text('X: $deltaX'),
        // Text('Y: $deltaY'),
        // Text('Z: $deltaZ'),
      ],
    );

  }
}