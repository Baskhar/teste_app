import 'package:app_estagio/app/screens/perfil_module/perfil_store.dart';
import 'package:app_estagio/app/states/perfil_state.dart';
import 'package:app_estagio/app/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCardEdificio extends StatefulWidget {
  const CustomCardEdificio({Key? key}) : super(key: key);

  @override
  State<CustomCardEdificio> createState() => _CustomCardEdificioState();
}

class _CustomCardEdificioState extends State<CustomCardEdificio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PerfilStore>();
    final state = store.value;
    return Container(height: 295, child: _buildProfileWidget(state));
  }

  Widget _buildProfileWidget(PerfilState state) {
    if (state is SucessPerfilState) {
      final perfil = state.perfil;
      final edificios = perfil.edificios;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTitleCardTextField(text: 'Edifícios'),
          // Text(
          //   'Edifícios',
          //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          // ),
          ListView.builder(
            shrinkWrap: true, // Desativa a rolagem do ListView
            itemCount: edificios!.length,
            itemBuilder: (context, index) {
              final edificio = edificios[index];
              return ListTile(
                leading: Image.asset(edificio.fotoEdificio),
                title: Row(
                  children: [
                    Row(
                      children: [
                        CustomTitleCardTextField(text: edificio.nomeEdificio),
                        SizedBox(
                          width: 5,
                        ),
                        edificio.cheked == true
                            ? Image.asset('assets/images/icon_chek_azul.png')
                            : Container(),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    Text(
                      edificio.perfilEdificio,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                subtitle: Text(
                  edificio.descricaoEdificio,
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
