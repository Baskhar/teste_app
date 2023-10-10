// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_estagio/app/models/horario_atendimento_model.dart';
import 'package:app_estagio/app/screens/editar_sobre_module/widgets/custom_container_horario.dart';
import 'package:app_estagio/app/screens/editar_sobre_module/widgets/custom_dropdown.dart';
import 'package:app_estagio/app/widgets/custom_title_card.dart';

class CustomCardEditHorarios extends StatefulWidget {
  final List<HorarioAtendimentoModel> horarios;
  final ValueChanged<List<HorarioAtendimentoModel>> onHorariosChanged;
  const CustomCardEditHorarios({
    Key? key,
    required this.horarios,
    required this.onHorariosChanged,
  }) : super(key: key);

  @override
  _CustomCardEditHorariosState createState() => _CustomCardEditHorariosState();
}

class _CustomCardEditHorariosState extends State<CustomCardEditHorarios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTitleCardTextField(text: 'Horario de atendimento'),
          SizedBox(
            height: 10,
          ),
          for (var horario in widget.horarios)
            if (horario.dia != 'Domingo' && horario.dia != 'Sábado')
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(child: CustomContainerHorario(text: horario.dia)),
                    SizedBox(width: 10),
                    CustomDropdownButton(
                      value: horario.inicioHorario!,
                      items: [
                        horario.inicioHorario!,
                      ], // Substitua pelos seus valores reais
                      onChanged: (newValue) {
                        setState(() {
                          horario.inicioHorario = newValue!;
                        });
                      },
                    ),
                    SizedBox(width: 10),
                    Text('s'),
                    SizedBox(width: 10),
                    CustomDropdownButton(
                      value: horario.fimHorario!,
                      items: [
                        horario.fimHorario!,
                      ], // Substitua pelos seus valores reais
                      onChanged: (newValue) {
                        setState(() {
                          horario.fimHorario = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                        flex: 16,
                        child: CustomContainerHorario(text: horario.dia)),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 40,
                      child: CustomDropdownButton(
                        value: horario.estado ?? 'Aberto',
                        items: ['Aberto', 'Fechado'],
                        onChanged: (newValue) {
                          setState(() {
                            horario.estado = newValue!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
