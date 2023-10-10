import 'package:app_estagio/app/models/perfil_model.dart';
import 'package:app_estagio/app/repository/repository.dart';
import 'package:app_estagio/app/states/perfil_state.dart';
import 'package:flutter/material.dart';

class PerfilStore extends ValueNotifier<PerfilState> {
  final Repository repository;
  PerfilStore(this.repository) : super(InitialPerfilState());

  Future getPerfil() async {
    value = LoadingPerfilState();

    await Future.delayed(Duration(seconds: 3));
    try {
      final perfil = await repository.getPerfil();
      value = SucessPerfilState(perfil: perfil);
    } catch (e) {
      value = ErrorPerfilState(message: e.toString());
    }
  }

  void updatePerfil(PerfilModel newPerfil) {
    value = LoadingPerfilState();
    print(value);
    // Simule uma operação de atualização (por exemplo, uma requisição a uma API)
    Future.delayed(Duration(seconds: 2), () {
      try {
        // Atualize o perfil no Repository
        repository.updatePerfil(newPerfil);
        value = SucessPerfilState(perfil: newPerfil);
        print(value);
      } catch (e) {
        value = ErrorPerfilState(message: e.toString());
        print(value);
      }
    });
  }
}
