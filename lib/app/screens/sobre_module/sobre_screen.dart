// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_estagio/app/screens/editar_sobre_module/editar_sobre_screen.dart';
import 'package:flutter/material.dart';

import 'package:app_estagio/app/models/perfil_model.dart';
import 'package:app_estagio/app/screens/perfil_module/widgets/custom_elevated_button.dart';
import 'package:app_estagio/app/screens/sobre_module/widgets/custom_card_contato.dart';
import 'package:app_estagio/app/screens/sobre_module/widgets/custom_card_horario_atendimento.dart';
import 'package:app_estagio/app/screens/sobre_module/widgets/custom_card_localizacao.dart';

import 'widgets/custom_card_edificio.dart';

class SobreScreen extends StatefulWidget {
  final PerfilModel perfil;
  const SobreScreen({
    Key? key,
    required this.perfil,
  }) : super(key: key);

  @override
  State<SobreScreen> createState() => _SobreScreenState();
}

class _SobreScreenState extends State<SobreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                EditarSobreScreen(perfil: widget.perfil),
                          ),
                        );
                      },
                      text: 'Editar seção sobre')),
              SizedBox(
                height: 15,
              ),
              CustomHorarioAtendimento(),
              SizedBox(
                height: 15,
              ),
              CustomCardEdificio(),
              CustomCardLocalizacao(),
              SizedBox(
                height: 20,
              ),
              CustomCardContato(),
            ],
          ),
        ),
      ),
    );
  }
}
