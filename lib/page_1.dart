import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const FormChange());
///
class FormChange extends StatefulWidget {
  const FormChange({Key? key}) : super(key: key);

  @override
  State<FormChange> createState() => _FormChangeState();
}

class _FormChangeState extends State<FormChange> {
  var cambiaColor = true;
  var elColor = const Color.fromRGBO(0, 150, 150, 1);
  var withX = 0.5;
  var heightX = 0.5;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: _sizeh(0.05),),
                const Text('Tocar cuadrado para alterarlo'),
                const Icon(Icons.arrow_downward)
              ],
            ),
            GestureDetector(
              onTap: () {
                double _temp1;
                double _temp2;
                do{
                  _temp1=Random().nextDouble();
                }
                while(_temp1<0.2 || _temp1>0.6);
                do{
                  _temp2=Random().nextDouble();
                }
                while(_temp2<0.2 || _temp2>0.6);
                cambiaColor 
                ? setState(() {
                  withX   = _temp1;
                  heightX = _temp2;
                  elColor=Color.fromRGBO(
                    Random().nextInt(256),
                    Random().nextInt(256),
                    Random().nextInt(256),
                    1
                  );
                })
                : setState(() {
                  withX   = _temp1;
                  heightX = _temp2;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  // margin: EdgeInsets.only(top: _sizeh(0.2)),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10) , color: elColor,
                  ),
                  width: _sizew(withX),
                  height: _sizeh(heightX),
                  
                ),
              ),
            ),
            Column(
              children: [
                const Text('Cambiar color?'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'no',
                      style: TextStyle(
                        fontWeight: cambiaColor ? FontWeight.normal : FontWeight.bold,
                        color: cambiaColor ? Colors.grey[300] : Colors.red[900]
                      ),
                    ),
                    Switch(
                      value: cambiaColor, onChanged: (value)=>setState(() {
                        cambiaColor=value;
                      })
                    ),
                    Text(
                      'si',
                      style: TextStyle(
                        fontWeight: cambiaColor ? FontWeight.bold : FontWeight.normal,
                        color: cambiaColor ? Colors.green[900] : Colors.grey[300]
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      )
    );
  }

  double _sizeh(double data) {
    final size = MediaQuery.of(context).size;
    return size.height*data;
  }
  double _sizew(double data) {
    final size = MediaQuery.of(context).size;
    return size.width*data;
  }
}