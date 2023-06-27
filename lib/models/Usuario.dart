class Usuario {
  late String _idUsuario;
  late String _nome;
  late String _email;
  late String _senha;


  Usuario();

  String get idUsuario => _idUsuario;

  set idUsuario(String value) {
    _idUsuario = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idUsuario": this._idUsuario,
      "nome": this._nome,
      "email": this._email,
      "senha": this._senha
    };
    return map;
  }

  String get nome => _nome;

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  set nome(String value) {
    _nome = value;
  }
}
