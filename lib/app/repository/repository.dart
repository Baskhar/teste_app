import 'package:app_estagio/app/models/atividades_model.dart';
import 'package:app_estagio/app/models/edificios_mode.dart';
import 'package:app_estagio/app/models/horario_atendimento_model.dart';
import 'package:app_estagio/app/models/moderadores_model.dart';
import 'package:app_estagio/app/models/perfil_model.dart';

class Repository {
  PerfilModel perfil = PerfilModel(
    fotoPerfil: 'assets/images/perfil.png',
    fotoBanner: 'assets/images/banner.jpeg',
    nome: 'Cidade ADM de MG',
    nomePerfil: '@cidadeadm',
    entrouEm: 'Jan/23',
    bio: 'Perfil Oficial da Cidade Administrativa de MG',
    localizacao: 'Cidade Administrativa',
    admGeral: '@paulo.oliveira32',
    email: 'edificiosul@governomg.com',
    whatsapp: '+55 15 91234-578',
    cheked: true,
    horarioAtendimento: generateHorariosAtendimento(),
    atividades: [
      AtividadesModel(
        dataAtividade: DateTime.now(),
        descricaoAtividade:
            'Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.',
        numeroComentarios: 1,
      ),
      AtividadesModel(
          descricaoAtividade: 'Lorem ipsum dolor sit amet consectetur.',
          numeroComentarios: 0,
          dataAtividade: DateTime.now()),
      AtividadesModel(
          descricaoAtividade:
              'Lorem ipsum dolor sit amet consectetur. Praesent congue magna sapien leo. Nunc varius sed volutpat amet turpis. Eros tempus.',
          numeroComentarios: 1,
          dataAtividade: DateTime.now())
    ],
    edificios: [
      EdificiosMode(
          nomeEdificio: 'Edifício Sul',
          perfilEdificio: '@edificiosul',
          cheked: true,
          fotoEdificio: 'assets/images/edificio_sul.png',
          descricaoEdificio: 'Edifício da Cidade Administrativa de MG',
          moderadorEdificio: '@felipeluizz_'),
      EdificiosMode(
          nomeEdificio: 'Edifício Norte',
          perfilEdificio: '@edificionorte',
          cheked: true,
          fotoEdificio: 'assets/images/edificio_norte.png',
          descricaoEdificio: 'Edifício da Cidade Administrativa de MG',
          moderadorEdificio: '@robertapaula20'),
      EdificiosMode(
          nomeEdificio: 'Edifício Central',
          perfilEdificio: '@edificiocentral',
          cheked: true,
          fotoEdificio: 'assets/images/edificio_central.png',
          descricaoEdificio: 'Edifício da Cidade Administrativa de MG',
          moderadorEdificio: '@eumunhozricardo'),
    ],
    moderadores: [
      ModeradoresModel(nome: '@oliverpereiraa'),
      ModeradoresModel(nome: '@21joaobotelho')
    ],
  );

  PerfilModel getPerfil() {
    return perfil;
  }

  void updatePerfil(PerfilModel newPerfil) {
    perfil.fotoPerfil = newPerfil.fotoPerfil ?? perfil.fotoPerfil;
    perfil.fotoBanner = newPerfil.fotoBanner ?? perfil.fotoBanner;
    perfil.nome = newPerfil.nome ?? perfil.nome;
    perfil.bio = newPerfil.bio ?? perfil.bio;
    perfil.localizacao = newPerfil.localizacao ?? perfil.localizacao;
    perfil.admGeral = newPerfil.admGeral ?? perfil.admGeral;
    perfil.email = newPerfil.email ?? perfil.email;
    perfil.whatsapp = newPerfil.whatsapp ?? perfil.whatsapp;
    perfil.cheked = newPerfil.cheked ?? perfil.cheked;
    perfil.horarioAtendimento =
        newPerfil.horarioAtendimento ?? perfil.horarioAtendimento;
    perfil.atividades = newPerfil.atividades ?? perfil.atividades;
    perfil.edificios = newPerfil.edificios ?? perfil.edificios;
    perfil.moderadores = newPerfil.moderadores ?? perfil.moderadores;
  }

  static List<HorarioAtendimentoModel> generateHorariosAtendimento() {
    final diasSemana = [
      'Segunda-Feira',
      'Terça-Feira',
      'Quarta-Feira',
      'Quinta-Feira',
      'Sexta-Feira',
      'Sábado',
      'Domingo',
    ];
    final horarioInicial = '9:00';
    final horarioFinal = '17:00';
    final estado = 'Aberto';

    return diasSemana
        .map(
          (dia) => HorarioAtendimentoModel(
            dia: dia,
            inicioHorario: horarioInicial,
            fimHorario: horarioFinal,
            estado: estado,
          ),
        )
        .toList();
  }
}
