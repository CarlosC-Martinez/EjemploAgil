import 'package:examen_1/modelos/usuario.dart';
import 'package:examen_1/vistas/consultar.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formState = GlobalKey<FormState>();
  List listusuarios=usuarios;
  String _usuario="";
  String _password="";
  var incorrecto=false;
  int i=0;

  
  late TextEditingController controladorusuario;
  late TextEditingController controladorpassword;

  void initState() {  
    controladorusuario = TextEditingController();
    controladorpassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.blueGrey[100],
      body: Form(
        key: _formState, 
        child:ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 90.0
          ) ,
          children: <Widget> [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage('data:image/png;base64,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'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    'Login',
                    style: TextStyle( 
                      fontFamily: 'NerkoOne',
                      fontSize: 50.0
                    ),                
                  ),
                ),
                
                
                TextFormField(
                  //enableInteractiveSelection: false,
                  // autofocus: true,
                  //textCapitalization: TextCapitalization.characters,
                  controller: controladorusuario,
                  decoration: InputDecoration(
                    hintText: 'USER-NAME',
                    labelText: 'Username',
                    suffixIcon: Icon(
                      Icons.verified_user
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                   validator: (String? value) {
                    return (value == null || value.isEmpty)? 'Digite el Usuario.' : null;
                  },
                ),
                Divider(
                  height: 15.0,
                ),
                
                
                TextFormField(
                  enableInteractiveSelection: false,
                  obscureText: true,
                  controller: controladorpassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    suffixIcon: Icon( Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
                   validator: (String? value) {
                    return (value == null || value.isEmpty)? 'Digite el Password.' : null;
                  },
                ),
                Divider(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    hoverColor: Colors.greenAccent,
                    child: Text('Sing in',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 30.0,
                      fontFamily:'NerkoOne' 
                    ),
                    ),
                    color: Colors.green,
                    onPressed: (){
                      if(_formState.currentState!.validate()){
                        for (var i = 0; i < listusuarios.length; i++) {
                          if(listusuarios[i].usuario==controladorusuario.text && listusuarios[i].password==controladorpassword.text){
                              Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) =>
                                    Consultar(),
                                ),
                            );
                            break;
                          }else{                          
                            showDialog(     
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: Text("Alerta"),
                                  content:
                                      Text('Usuario o password incorrectos! '),
                                  actions: [
                                    TextButton(
                                      onPressed: () {     
                                        Navigator.pop(context);                                 
                                        controladorusuario.clear();
                                        controladorpassword.clear();
                                        incorrecto=true;
                                      },
                                      child: Text(
                                        'Aceptar',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    )
                                  ],
                                ));
                             
                          }
                          if(incorrecto){incorrecto=false;break;}
                            
                        }
                      }
                                         
                    }, 
                  ),
                )
              ],
            )
          ],
        ),),
    );
  }
}