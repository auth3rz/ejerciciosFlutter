
import 'package:flutter/material.dart';

class BasicLogin extends StatefulWidget {
  const BasicLogin({Key? key}) : super(key: key);

  @override
  State<BasicLogin> createState() => _BasicLoginState();
}

final userList = [
  ['user1', 'pass1'],
  ['user2', 'pass2'],
];

class _BasicLoginState extends State<BasicLogin> {
  final userName  = TextEditingController();
  final passField = TextEditingController();
  FocusNode ? focus1;
  
  var registroValido = false;

  @override
  void initState() {
    focus1 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focus1!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(_sizew(0.05)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: userName,
                      decoration: const InputDecoration(
                        hintText: 'Usuario'
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo requerido';
                        }
                        return null;
                      },
                      onEditingComplete: (){
                        focus1!.requestFocus();
                      },
                    ),
                    SizedBox(
                      height: _sizeh(0.02),
                    ),
                    TextFormField(
                      controller: passField,
                      focusNode: focus1,
                      decoration: const InputDecoration(
                        hintText: 'Contraseña'
                      ),
                      obscureText: true,
                      obscuringCharacter: '░',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo requerido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: _sizeh(0.02),
                    ),
                    GestureDetector(
                      onTap: passField.text.isNotEmpty && userName.text.isNotEmpty ? () {
                        for (final i in userList) {
                          if (i[0]==userName.text && i[1]==passField.text) {
                            setState(() {
                              registroValido=true;
                            });
                            break;
                          } else {
                            setState(() {
                              userName.clear();
                              passField.clear();
                            });
                          }
                        }
                      } : () {},
                      child: Container(
                        height: _sizeh(0.05),
                        width: _sizew(0.3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: passField.text.isNotEmpty && userName.text.isNotEmpty ? Colors.green[900] : Colors.grey[800]
                        ),
                        child: Center(child: Text('Validar', style: TextStyle(color: Colors.white.withAlpha(250)),)),
                      ),
                    ),
                  ],
                ),
              )
            ),
            registroValido
            ? Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      registroValido=false;
                      passField.clear();
                      userName.clear();
                    });
                  },
                  child: Icon(
                    Icons.check_circle, size: _sizeh(0.3),
                    color: Colors.green[500],
                  ),
                ),
              ),
            )
            : Container(),
          ]
        )
      ),
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