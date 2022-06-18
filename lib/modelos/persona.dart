class Persona{
  var codigo;
  var foto;
  var nombre;
  var apellido;
  var profesion;
  var fechaNacimiento;

  Persona({this.codigo, this.foto, this.nombre, this.apellido, this.profesion, this.fechaNacimiento});
  Persona.empty();
}

List<Persona> personas = [
  Persona(
    codigo: '0001',
    foto: 'https://www.hola.com/imagenes/estar-bien/20210706192625/personalidad-adultos-altas-capacidades-psicologia/0-974-472/altas-capacidades-m.jpg?filter=w360',
    nombre: 'Juana',
    apellido: 'Perez',
    profesion: 'Ingeniero de sistemas',
    fechaNacimiento: '27/05/2020'
  ),
  Persona(
    codigo: '0002',
    foto: 'https://cdn.forbes.com.mx/2019/04/blackrrock-invertir-1-640x360.jpg',
    nombre: 'Luisa',
    apellido: 'Lopez',
    profesion: 'Ingeniero civil',
    fechaNacimiento: '28/05/1993'
  ),

];