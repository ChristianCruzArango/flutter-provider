import 'package:flutter/material.dart';
import 'package:singelton/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => this._usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;

  set usuario(Usuario user) {
    this._usuario = user;
    //manda un mensaje a todos los que esten utilizando mi instancia
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    this
        ._usuario
        .profesiones
        .add('Profesion: ${usuario.profesiones.length + 1}');
    notifyListeners();
  }
}
