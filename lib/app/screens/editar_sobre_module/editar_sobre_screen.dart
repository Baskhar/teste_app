import 'package:app_estagio/app/models/edificios_mode.dart';
import 'package:app_estagio/app/models/horario_atendimento_model.dart';
import 'package:app_estagio/app/models/perfil_model.dart';
import 'package:app_estagio/app/screens/editar_perfil_module/widgets/custom_text_field.dart';
import 'package:app_estagio/app/screens/editar_sobre_module/widgets/custom_card_edit_edificios.dart';
import 'package:app_estagio/app/screens/editar_sobre_module/widgets/custom_card_edit_horarios.dart';
import 'package:app_estagio/app/screens/perfil_module/perfil_store.dart';
import 'package:app_estagio/app/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarSobreScreen extends StatefulWidget {
  final PerfilModel perfil;
  const EditarSobreScreen({required this.perfil, super.key});

  @override
  State<EditarSobreScreen> createState() => _EditarSobreScreenState();
}

class _EditarSobreScreenState extends State<EditarSobreScreen> {
  final _controllerNome = TextEditingController();
  final _controllerWhatsapp = TextEditingController();
  final _controllerEmail = TextEditingController();
  @override
  void initState() {
    super.initState();
    _controllerNome.text =
        widget.perfil.nome ?? 'Erro ao consultar localização';
    _controllerWhatsapp.text =
        widget.perfil.whatsapp ?? 'Erro ao consultar Whatsapp';
    _controllerEmail.text = widget.perfil.email ?? 'Erro ao consultar Email';
  }

  @override
  Widget build(BuildContext context) {
    final perfilStore = context.watch<PerfilStore>();
    List<HorarioAtendimentoModel> horarios =
        widget.perfil.horarioAtendimento ?? [];
    List<EdificiosMode> edificios = widget.perfil.edificios ?? [];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, // Remova a sombra
        backgroundColor: Colors.white, // Cor de fundo branca
        foregroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Editar Sobre',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Cor do texto
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final List<HorarioAtendimentoModel> horarios =
                  widget.perfil.horarioAtendimento ?? [];
              final List<EdificiosMode> edificios =
                  widget.perfil.edificios ?? [];

              // Aqui você pode coletar os dados dos horários e edifícios,
              // semelhante ao que foi feito na tela de edição de perfil

              final newPerfil = PerfilModel(
                fotoPerfil: widget.perfil.fotoPerfil,
                fotoBanner: widget.perfil.fotoBanner,
                localizacao: widget.perfil.localizacao,
                atividades: widget.perfil.atividades,
                cheked: widget.perfil.cheked,
                entrouEm: widget.perfil.entrouEm,
                nomePerfil: widget.perfil.entrouEm,

                bio: widget.perfil.bio,
                nome: _controllerNome.text,
                admGeral: widget.perfil.admGeral,
                moderadores: widget.perfil.moderadores,
                whatsapp: _controllerWhatsapp.text,
                email: _controllerEmail.text,
                horarioAtendimento:
                    horarios, // Atualize com os horários coletados
                edificios: edificios, // Atualize com os edifícios coletados
              );

              perfilStore.updatePerfil(newPerfil);
              Navigator.pop(context);
            },
            child: Text(
              'Salvar',
              style: TextStyle(
                color: Colors.blue, // Cor do botão
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCardEditHorarios(
              horarios: horarios,
              onHorariosChanged: (newHorarios) {
                setState(() {
                  horarios = newHorarios;
                });
              },
            ),
            CustomCardEditEdificios(
              edificios: edificios,
              onEdificiosChanged: (newEdificios) {
                setState(() {
                  // Atualize os edifícios no estado local
                  edificios = newEdificios;
                });
              },
            ),
            SizedBox(
              height: 15,
            ),
            CustomTitleCardTextField(text: 'Localização'),
            SizedBox(
              height: 10,
            ),
            CustomTextField(controller: _controllerNome),
            SizedBox(
              height: 15,
            ),
            CustomTitleCardTextField(text: 'Whatsapp'),
            SizedBox(
              height: 10,
            ),
            CustomTextField(controller: _controllerWhatsapp),
            SizedBox(
              height: 15,
            ),
            CustomTitleCardTextField(text: 'E-mail'),
            SizedBox(
              height: 10,
            ),
            CustomTextField(controller: _controllerEmail),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      )),
    );
  }
}
