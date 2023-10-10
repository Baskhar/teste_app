import 'package:app_estagio/app/models/perfil_model.dart';

abstract class PerfilState {}

class InitialPerfilState extends PerfilState {}

class SucessPerfilState extends PerfilState {
  final PerfilModel perfil;

  SucessPerfilState({required this.perfil});
}

class LoadingPerfilState extends PerfilState {}

class ErrorPerfilState extends PerfilState {
  final String message;

  ErrorPerfilState({required this.message});
}
