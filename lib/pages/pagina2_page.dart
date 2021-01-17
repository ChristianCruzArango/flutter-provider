import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singelton/models/usuario.dart';
import 'package:singelton/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: usuarioService.existeUsuario
              ? Text('Nombre : ${usuarioService.usuario.nombre}')
              : Text('Pagina 2'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text('Establecer Usuario',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  final newUser = Usuario(
                      nombre: 'Christian cruz',
                      edad: 29,
                      profesiones: ['Futbolista', 'Musìco', 'Guitarrista']);
                  usuarioService.usuario = newUser;
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child:
                    Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  usuarioService.cambiarEdad(40);
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text('Añadir Profesion',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  usuarioService.agregarProfesion();
                },
              )
            ],
          ),
        ));
  }
}
