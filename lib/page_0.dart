import 'package:flutter/material.dart';



class ContadorPage extends StatefulWidget {
  const ContadorPage({Key? key}) : super(key: key);

  @override
  State<ContadorPage> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    repintar();
  }
  void _decrementCounter() {
    _counter--;
    repintar();
  }
  void _ceroCounter() {
    _counter=0;
    repintar();
  }

  void repintar(){
    setState(() {});
  }

  double _sizeh(double data) {
    final size = MediaQuery.of(context).size;
    return size.height*data;
  }
  double _sizew(double data) {
    final size = MediaQuery.of(context).size;
    return size.width*data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejemplo Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: _sizeh(0.2),
            ),
            Text(
              'El valor acual es:',
              style: TextStyle(fontSize: _sizeh(0.02)),
            ),
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: _sizeh(0.04),
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: _sizeh(0.2),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _sizew(0.01), vertical: _sizeh(0.01)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _decrementCounter(),
                    child: Icon(Icons.remove_circle,size: _sizew(0.05)<25?_sizeh(0.05):_sizew(0.05), color: Colors.red[700],),
                  ),
                  GestureDetector(
                    onTap: () => _ceroCounter(),
                    child: Icon(Icons.settings_backup_restore_rounded,size: _sizew(0.05)<25?_sizeh(0.05):_sizew(0.05), color: Colors.grey[700],),
                  ),
                  GestureDetector(
                    onTap: () => _incrementCounter(),
                    child: Icon(Icons.add_circle,size: _sizew(0.05)<25?_sizeh(0.05):_sizew(0.05), color: Colors.green[700],),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
