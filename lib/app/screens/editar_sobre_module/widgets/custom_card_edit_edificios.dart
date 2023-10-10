// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:app_estagio/app/models/edificios_mode.dart';
import 'package:app_estagio/app/screens/perfil_module/widgets/custom_elevated_button.dart';
import 'package:app_estagio/app/widgets/custom_title_card.dart';

class CustomCardEditEdificios extends StatelessWidget {
  final List<EdificiosMode> edificios;
  final ValueChanged<List<EdificiosMode>> onEdificiosChanged;
  const CustomCardEditEdificios({
    Key? key,
    required this.edificios,
    required this.onEdificiosChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CustomTitleCardTextField(text: 'Edifícios'),
              Spacer(),
              CustomElevatedButton(onPressed: () {}, text: 'Adicionar'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: edificios.length,
              itemBuilder: (context, index) {
                final edificio = edificios[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(edificio.fotoEdificio),
                  ),
                  title: Row(
                    children: [
                      CustomTitleCardTextField(text: edificio.nomeEdificio),
                      SizedBox(
                        width: 5,
                      ),
                      edificio.cheked == true
                          ? Image.asset('assets/images/icon_chek_azul.png')
                          : Container(),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      CustomTitleCardTextField(text: 'Administrador'),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: Container(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: TextFormField(
                            initialValue: edificio.moderadorEdificio,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 10),
                              suffixIcon: IconButton(
                                iconSize: 20,
                                icon: Icon(Icons.edit,
                                    color: Colors
                                        .grey), // Ícone de lápis à direita
                                onPressed: () {
                                  // Ação ao pressionar o ícone de lápis
                                  // Você pode adicionar aqui a lógica para editar o campo
                                },
                              ),
                            ),
                            onChanged: (newValue) {
                              // Aqui você pode atualizar o nome do administrador
                              edificio.moderadorEdificio = newValue;
                            },
                          ),
                        ),
                      )),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
