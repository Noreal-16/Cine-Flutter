import 'package:flutter/material.dart';
import 'registro.dart';
import 'home.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  //agregamos dos variables TextEditingControllers para poder limbiar las cajas de texto
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          //se utiliza para dar 4 direcciones de espaciado(para desplazamiendo de cada uno de los cuatro lados)
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/login_icon.png'),
                SizedBox(height: 16.0),
                Text('Login')
              ],
            ),
            SizedBox(height: 120.0),
            //label para el usuario
            TextField(
              //se llama a las variables creadas
              controller: _userNameController,
              //Las clases TextField y InputDecorator usan objetos InputDecoration para describir su decoración. (De hecho, esta clase es simplemente la configuración de un InputDecorator , que hace todos el trabajo pesado)
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            //tamanio del cuadro
            SizedBox(height: 12.0),
            //para la contrasenia
            TextField(
              //se llama a las variables creadas
              controller: _passwordController,
              decoration: InputDecoration(
                //campo significa que el fondo del campo de texto se rellena ligeramente para ayudar a las personas a reconocer el área objetivo del campo de texto
                  filled: true,
                  labelText: 'Password'
              ),
              //obscureText: truereemplaza automáticamente la entrada que el usuario escribe con viñetas, lo cual es apropiado para las contraseñas.
              obscureText: true,
            ),
            //para crear botones
            ButtonBar(
              children: <Widget>[
                //agregamos dos botones a este grupo de widget
                FlatButton(
                  child: Text('Registrer'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistroUsuario()));
                  },
                ),
                //función RaisedButton, haga estallar la ruta más reciente desde el navegador:
                RaisedButton(
                  child: Text('Siguiente'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CineHome()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

