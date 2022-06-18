class Usuario{
  var codigo;
  var usuario;
  var password;
  

  Usuario({this.codigo, this.usuario, this.password});
  Usuario.empty();
}

List<Usuario> usuarios = [
  Usuario(
    codigo: '0001',
    usuario: 'admin',
    password: 'admin',
  ),
  Usuario(
    codigo: '0002',
    usuario: 'invitado',
    password: 'invitado',
  ),

];