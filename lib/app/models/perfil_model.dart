// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_estagio/app/models/atividades_model.dart';
import 'package:app_estagio/app/models/edificios_mode.dart';
import 'package:app_estagio/app/models/horario_atendimento_model.dart';
import 'package:app_estagio/app/models/moderadores_model.dart';

class PerfilModel {
  String? fotoPerfil;
  String? fotoBanner;
  String? entrouEm = '';
  String? nome;
  String? nomePerfil;
  String? bio;
  String? localizacao;
  String? admGeral;
  String? whatsapp;
  String? email;
  bool? cheked;
  List<ModeradoresModel>? moderadores;
  List<EdificiosMode>? edificios;
  List<HorarioAtendimentoModel>? horarioAtendimento;
  List<AtividadesModel>? atividades;
  PerfilModel({
    this.fotoPerfil,
    this.atividades,
    this.fotoBanner,
    this.cheked,
    this.entrouEm,
    this.nome,
    this.bio,
    this.localizacao,
    this.admGeral,
    this.whatsapp,
    this.email,
    this.moderadores,
    this.edificios,
    this.horarioAtendimento,
    this.nomePerfil,
  });
}
