import 'package:examen_1/modelos/persona.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';


class Agregar extends StatefulWidget {
  Agregar({Key? key}) : super(key: key);

  @override
  State<Agregar> createState() => _AgregarState();
}

class _AgregarState extends State<Agregar> {
  final _formState = GlobalKey<FormState>();
   List<Persona> _personaadd = [];

  late TextEditingController controladorcodigo;
  late TextEditingController controladorfoto;
  late TextEditingController controladornombre;
  late TextEditingController controladorapellido;
  late TextEditingController controladorprofesion;
  late TextEditingController controladorfechaNacimiento;
  late TextEditingController controladordireccion;

  void initState() {
    
    controladorcodigo = TextEditingController();
    controladorfoto = TextEditingController();
    controladornombre = TextEditingController();
    controladorapellido = TextEditingController();
    controladorprofesion = TextEditingController();
    controladorfechaNacimiento = TextEditingController();
    controladordireccion = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Personas'),
      ),
      backgroundColor: Colors.blueGrey[100],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed:(){
          if(_formState.currentState!.validate()){guardarPersona();} }
        ),

      body: Form(
        key: _formState,
        child: ListView(
          children: [
            Divider(
                  height: 18.0,
                ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: TextFormField(
                controller: controladorcodigo,
                decoration: InputDecoration(
                  hintText: "Codigo",
                  labelText: "Codigo",
                  prefixIcon: Icon(Icons.supervised_user_circle),
                  border: new OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10),
                    borderSide: new BorderSide(color:Colors.teal)
                  ),
                  suffix: GestureDetector(
                    child: Icon(Icons.clear),
                    onTap: () {
                    controladorcodigo.clear();
                    },
                  )
                 ),
                 validator: (String? value) {
                    return (value == null || value.isEmpty)? 'Digite el Codigo.' : null;
                  },
                ),
            ),

              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: TextFormField(
                controller: controladorfoto,
                decoration: InputDecoration(
                  hintText: "Foto",
                  labelText: "Foto",
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
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: TextFormField(
                controller: controladornombre,
                decoration: InputDecoration(
                  hintText: "Nombre",
                  labelText: "Nombre",
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
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: TextFormField(
                controller: controladorapellido,
                decoration: InputDecoration(
                  hintText: "Apellido",
                  labelText: "Apellido",
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
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: TextFormField(
                controller: controladorprofesion,
                decoration: InputDecoration(
                  hintText: "Profesion",
                  labelText: "Profesion",
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
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: TextFormField(
                controller: controladorfechaNacimiento,
                decoration: InputDecoration(
                  hintText: "Fecha de nacimiento",
                  labelText: "Fecha de nacimiento",
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
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: TextFormField(
                controller: controladordireccion,
                decoration: InputDecoration(
                  hintText: "Direccion",
                  labelText: "Direccion",
                  prefixIcon: Icon(Icons.supervised_user_circle),
                  border: new OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10),
                    borderSide: new BorderSide(color:Colors.teal)
                  ),
                  suffix: GestureDetector(
                    child: Icon(Icons.clear),
                    onTap: () {
                    controladordireccion.clear();
                    },
                  )
                 ),
                 validator: (String? value) {
                    return (value == null || value.isEmpty)? 'Digite direccion.' : null;
                  },
                ),
              )




          ],
        ),

      ),
    );
  }

  guardarPersona(){
    _personaadd.add(Persona(
                      codigo: controladorcodigo.text,
                      foto: controladorfoto.text.substring(0, 1).toUpperCase() + controladorfoto.text.substring(1),
                      nombre: controladornombre.text,
                      apellido: controladorapellido.text.substring(0, 1).toUpperCase() + controladorapellido.text.substring(1),
                      profesion: controladorprofesion.text.substring(0, 1).toUpperCase() + controladorprofesion.text.substring(1),
                      fechaNacimiento: controladorfechaNacimiento.text
                      ));
                  Navigator.pop(context, _personaadd);
  }
}