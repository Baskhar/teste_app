import 'package:app_estagio/app/screens/perfil_module/perfil_store.dart';
import 'package:app_estagio/app/states/perfil_state.dart';
import 'package:app_estagio/app/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomHorarioAtendimento extends StatefulWidget {
  const CustomHorarioAtendimento({Key? key}) : super(key: key);

  @override
  State<CustomHorarioAtendimento> createState() =>
      _CustomHorarioAtendimentoState();
}

class _CustomHorarioAtendimentoState extends State<CustomHorarioAtendimento> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   context.read<PerfilStore>().getPerfil();
    // });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PerfilStore>();
    final state = store.value;
    return Container(height: 270, child: _buildProfileWidget(state));
  }

  Widget _buildProfileWidget(PerfilState state) {
    if (state is SucessPerfilState) {
      final perfil = state.perfil;
      final horariosAtendimento = perfil.horarioAtendimento ?? [];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleCardTextField(text: 'Horário de atendimento'),
          SizedBox(
            height: 15,
          ),
          Column(
            children: horariosAtendimento
                .asMap()
                .entries
                .map(
                  (entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              entry.value.dia,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        // Spacer(),
                        Expanded(
                            child: Container(
                          height: 1,
                          color: Colors.grey,
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        //Spacer(),
                        if (entry.key < horariosAtendimento.length - 2)
                          Row(
                            children: [
                              Text(
                                entry.value.inicioHorario.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                'às',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                entry.value.fimHorario.toString(),
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        else
                          Text(
                            entry.value.estado ?? 'Indisponível',
                            style: TextStyle(color: Colors.grey),
                          ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
