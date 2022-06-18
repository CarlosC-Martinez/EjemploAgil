import 'package:examen_1/modelos/persona.dart';
 import 'package:examen_1/vistas/agregar.dart';
import 'package:flutter/material.dart';

class Consultar extends StatefulWidget {
  Consultar({Key? key}) : super(key: key);

  @override
  State<Consultar> createState() => _ConsultarState();
}

class _ConsultarState extends State<Consultar> {
  final _formState = GlobalKey<FormState>();
  List _listPersonas = personas;
  var fechaActual = DateTime.now();
  String fechan="";
  // String year="";
  String mes="01";
  String dia="30";
  var edad=0;
  var a=0;

  //late TextEditingController controladorcodigo;
  late TextEditingController controladorfoto;
  late TextEditingController controladornombre;
  late TextEditingController controladorapellido;
  late TextEditingController controladorprofesion;
  late TextEditingController controladorfechaNacimiento;

  void initState() {
    
    //controladorcodigo = TextEditingController();
    controladorfoto = TextEditingController();
    controladornombre = TextEditingController();
    controladorapellido = TextEditingController();
    controladorprofesion = TextEditingController();
    controladorfechaNacimiento = TextEditingController();
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listado de Personas'),
      automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.blueGrey[100],
      body: ListView.builder(
        itemCount: _listPersonas.length,
        itemBuilder: (BuildContext context, int index) {
          fechan =_listPersonas[index].fechaNacimiento.substring(6, 10);
          mes= _listPersonas[index].fechaNacimiento.substring(3, 5);
          dia=_listPersonas[index].fechaNacimiento.substring(0, 2); 
          edad=fechaActual.year - int.parse(fechan);
          (fechaActual.month>=int.parse(mes) && fechaActual.day>=int.parse(dia))?a=edad:a=edad-1;
          return ListTile(
            onLongPress: () {
                //_dialogo(context, _listPersonas[index],index);
                _actualizar(context, _listPersonas[index],index);
              },
            title: Text(_listPersonas[index].nombre+' '+_listPersonas[index].apellido),
            subtitle: Text(_listPersonas[index].profesion),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_listPersonas[index].foto),
              //radius: 30.0,
             maxRadius: 20.0,
            ),
            
            
            trailing: Column(children: [
              //Icon(Icons.add),
              Text(_listPersonas[index].fechaNacimiento), 
              Text(a.toString()+' Años')  
                        
            ],
            )
            
          );
        },
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) =>
                  Agregar(),
              ),
          ).then((resultado) {
            _listPersonas.addAll(resultado);
            setState(() {});
          });
        },
        child: Icon(Icons.add),
        ),
      );
  }

/*   calcularedad(context, String fechan){
    var fechaActual = DateTime.now();


  } */


  _dialogo(context, Persona personaid,int index) {
    showDialog(
      
        context: context,
        builder: (_) => AlertDialog(
              title: Text(personaid.nombre),
              content:
                  Text('Elija una opcion '),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this._listPersonas.remove(personaid);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    setState(() {
                      _actualizar(context, personaid,index);
                      Navigator.pop(context);
                    });
                  },
                  child: Text(
                    'Modificar',
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }

 _actualizar(context, Persona persona,int index){
    //controladorcodigo.text=persona.codigo;
    controladorfoto.text = persona.foto;
    controladornombre.text=persona.nombre;
    controladorapellido.text=persona.apellido;
    controladorprofesion.text = persona.profesion;
    controladorfechaNacimiento.text = persona.fechaNacimiento;
    showDialog(
        
        context: context,
        builder: (_) => AlertDialog(
             backgroundColor: Colors.blueGrey[100],
              title: Text('Actualizar Persona'),
              content:
                  Form(
                    key: _formState,
                    child: Column(
                  //Column(
                    children: [                   
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: TextFormField(
                          controller: controladorfoto,
                          decoration: InputDecoration(
                            hintText: "Foto",
                            labelText: 'Foto',
                            prefixIcon: Icon(Icons.supervised_user_circle),
                            border: new OutlineInputBorder(
                              borderRadius:BorderRadius.circular(10),
                              borderSide: new BorderSide(color:Colors.teal)
                            ),
                            suffix: GestureDetector(
                              child: Icon(Icons.clear),
                              onTap: () {
                              controladorfoto.clear();
                              },
                            )
                          ),
                          validator: (String? value) {
                              return (value == null || value.isEmpty)? 'Agrege una foto.' : null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: TextFormField(
                          controller: controladornombre,
                          decoration: InputDecoration(
                            hintText: "Nombre",
                            labelText: 'Nombre',
                            prefixIcon: Icon(Icons.supervised_user_circle),
                            border: new OutlineInputBorder(
                              borderRadius:BorderRadius.circular(10),
                              borderSide: new BorderSide(color:Colors.teal)
                            ),
                            suffix: GestureDetector(
                              child: Icon(Icons.clear),
                              onTap: () {
                              controladornombre.clear();
                              },
                            )
                          ),
                          validator: (String? value) {
                              return (value == null || value.isEmpty)? 'Digite el Nombre.' : null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: TextFormField(
                          controller: controladorapellido,
                          decoration: InputDecoration(
                            hintText: "Apellido",
                            labelText: 'Apellido',
                            prefixIcon: Icon(Icons.supervised_user_circle),
                            border: new OutlineInputBorder(
                              borderRadius:BorderRadius.circular(10),
                              borderSide: new BorderSide(color:Colors.teal)
                            ),
                            suffix: GestureDetector(
                              child: Icon(Icons.clear),
                              onTap: () {
                              controladorapellido.clear();
                              },
                            )
                          ),
                          validator: (String? value) {
                              return (value == null || value.isEmpty)? 'Digite el Apellido.' : null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: TextFormField(
                          controller: controladorprofesion,
                          decoration: InputDecoration(
                            labelText: 'Profesion',
                            hintText: "Profesion",
                            prefixIcon: Icon(Icons.supervised_user_circle),
                            border: new OutlineInputBorder(
                              borderRadius:BorderRadius.circular(10),
                              borderSide: new BorderSide(color:Colors.teal)
                            ),
                            suffix: GestureDetector(
                              child: Icon(Icons.clear),
                              onTap: () {
                              controladorprofesion.clear();
                              },
                            )
                          ),
                          validator: (String? value) {
                              return (value == null || value.isEmpty)? 'Digite el Profesion.' : null;
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          child: TextFormField(
                          controller: controladorfechaNacimiento,
                          decoration: InputDecoration(
                            hintText: "Fecha de nacimiento",
                            labelText: 'Fecha de nacimiento',
                            prefixIcon: Icon(Icons.supervised_user_circle),
                            border: new OutlineInputBorder(
                              borderRadius:BorderRadius.circular(10),
                              borderSide: new BorderSide(color:Colors.teal)
                            ),
                            suffix: GestureDetector(
                              child: Icon(Icons.clear),
                              onTap: () {
                              controladorfechaNacimiento.clear();
                              },
                            )
                          ),
                          validator: (String? value) {
                              return (value == null || value.isEmpty)? 'Digite la fecha de nacimiento.' : null;
                            },
                          ),
                        )
                      ]),
                  ),
                  //Text('Esta Seguro de Eliminar a: ' + estudianteid.nombre),
                  
              actions: [
                FlatButton(
                  onPressed: () {
                    if(_formState.currentState!.validate()){
                      setState(() {
                      this._listPersonas[index]=Persona(
                        codigo: _listPersonas[index].codigo,
                        foto: controladorfoto.text,
                        nombre: controladornombre.text,
                        apellido: controladorapellido.text,
                        profesion: controladorprofesion.text,
                        fechaNacimiento: controladorfechaNacimiento.text,
                        
                      );
                      //remove(estudiante);
                      Navigator.pop(context);
                    });
                    }
                    
                  },
                  color: Colors.indigo,
                  child: Text(
                    'Actualizar',
                    style: TextStyle(color: Colors.white, fontWeight:FontWeight.normal, fontSize: 15.0),
                  ),
                ),

                FlatButton(
                  onPressed: () {
                    setState(() {
                      this._listPersonas.remove(persona);
                      Navigator.pop(context);
                    });                  
                    
                  },
                  color: Colors.red,
                  child: Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.white, fontWeight:FontWeight.normal, fontSize: 15.0),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.indigo,fontSize: 15.0),
                  ),
                )
              ],
            ));
  }
}