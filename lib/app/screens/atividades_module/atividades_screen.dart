import 'package:app_estagio/app/models/atividades_model.dart';
import 'package:app_estagio/app/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/perfil_model.dart';

class AtividadesScreen extends StatelessWidget {
  final PerfilModel perfil;

  const AtividadesScreen({Key? key, required this.perfil}) : super(key: key);
  String _formatDataAtividade(DateTime dataAtividade) {
    final dataAtual = DateTime.now();
    final diferenca = dataAtual.difference(dataAtividade);

    if (diferenca.inDays == 0) {
      return 'Hoje';
    } else if (diferenca.inDays <= 31) {
      return '${diferenca.inDays} dias';
    } else {
      final formattedDate = DateFormat('dd MMM', 'pt_BR').format(dataAtividade);
      return formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    return Container(
      height: altura,
      child: _buildAtividadesList(),
    );
  }

  Widget _buildAtividadesList() {
    return ListView.builder(
      itemCount: perfil.atividades?.length ?? 0,
      itemBuilder: (context, index) {
        final atividade = perfil.atividades![index];
        return _buildAtividadeTile(atividade);
      },
    );
  }

  Widget _buildAtividadeTile(AtividadesModel atividade) {
    final dataFormatada = _formatDataAtividade(atividade.dataAtividade);
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(
              perfil.fotoPerfil!,
            ),
          ),
          title: Row(
            children: [
              CustomTitleCardTextField(text: perfil.nome.toString()),
              SizedBox(
                width: 5,
              ),
              perfil.cheked == true
                  ? Image.asset('assets/images/icon_chek_amarelo.png')
                  : Container(),
              SizedBox(
                width: 5,
              ),
              Text(
                perfil.nomePerfil.toString(),
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '- ${dataFormatada}',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              '${atividade.descricaoAtividade.toString()}',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset('assets/images/icon_comentarios.png'),
              SizedBox(
                width: 10,
              ),
              Text(atividade.numeroComentarios.toString()),
            ],
          ),
        ),
      ],
    );
  }
}
