import 'dart:io';
import 'package:flutter/material.dart';



class RegistroUsuario extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro Usuarios'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/registro.png'),
              SizedBox(height: 13.0),
              Text('Registro'),
              Formulario()
            ],
          ),
        )
      ),
        floatingActionButton: FloatingActionButton(
           onPressed: (){

            },
          tooltip: 'Help',
          child: Icon(Icons.help),

    ),
    );
  }
}


class Formulario extends StatefulWidget{
  @override
  StateFormulario createState(){
    return StateFormulario();
  }
}

class StateFormulario extends State<Formulario> {




  File _selecionaImagen;
  //para crear una clave global para las validaciones
  final _formKey = GlobalKey<FormState>();

  //variables para mostrar contrasenia
  bool _obscureText = true;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Ingrese su Nombre',
                    ),
                    validator: (value) {
                      if (value.isEmpty || value.contains('@')) {
                        return 'El campo esta vacio o contiene caracteres invalidos';
                      }
                    },

                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Ingrese su Apellido',
                      ),
                      validator: (value) {
                      if (value.isEmpty || value.contains('@')) {
                        return 'El campo esta vacio o contiene caracteres invalidos';
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.mail),
                      labelText: 'Ingrese su Correo',
                    ),
                    validator: (value) {
                      if (value.isEmpty ) {
                        return 'El campo esta vacio o contiene caracteres invalidos';
                      }
                    },
                  ),
                  TextFormField(

                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Cotraseña',
                      suffixIcon: GestureDetector(
                        onLongPress: () {
                          setState(() {
                            _obscureText = true;
                          });
                        },
                        onLongPressUp: () {
                          setState(() {
                            _obscureText = false;
                          });
                        },
                        child: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) => value.length < 6 ? 'La contrasenia es muy pequenia.' : null,
                    onSaved: (value) => _password = value,
                    obscureText: _obscureText,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Repita su Cotraseña',
                      suffixIcon: GestureDetector(
                        onLongPress: () {
                          setState(() {
                            _obscureText = true;
                          });
                        },
                        onLongPressUp: () {
                          setState(() {
                            _obscureText = false;
                          });
                        },
                        child: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off),
                      ),
                    ),

                    validator: (value) => value.length < 6 ? 'La contrasenia es muy pequenia.' : null,
                    onSaved: (value) => _password = value,
                    obscureText: _obscureText,


                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: RaisedButton(
                          onPressed: (){
                            if(_formKey.currentState.validate()){
                              Scaffold
                                  .of(context)
                                  .showSnackBar(SnackBar(content: Text('Procesando Datos')));
                            }
                          },
                          child: Text('Resgistrarse'),
                        ),
                      )

                  ),

                ],

              ),
            ),
          ),
        )

    );

  }

}
