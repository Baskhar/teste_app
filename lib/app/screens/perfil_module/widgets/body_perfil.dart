// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_estagio/app/screens/atividades_module/atividades_screen.dart';
import 'package:app_estagio/app/screens/perfil_module/perfil_screen.dart';
import 'package:flutter/material.dart';

import 'package:app_estagio/app/models/perfil_model.dart';
import 'package:app_estagio/app/screens/sobre_module/sobre_screen.dart';
import 'package:provider/provider.dart';

enum BottomTab { Atividades, Sobre, Avisos }

class BodyPerfil extends StatefulWidget {
  final PerfilModel perfil;

  BodyPerfil({
    Key? key,
    required this.perfil,
  }) : super(key: key);

  @override
  _BodyPerfilState createState() => _BodyPerfilState();
}

class _BodyPerfilState extends State<BodyPerfil> {
  BottomTab _selectedTab = BottomTab.Atividades; // Tab padrão
  bool showButton = true; // Inicialize com true
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildTabButton(BottomTab.Atividades, 'Atividades'),
            Spacer(),
            _buildTabButton(BottomTab.Sobre, 'Sobre'),
            Spacer(),
            _buildTabButton(BottomTab.Avisos, 'Avisos e Comunicações'),
          ],
        ),
        Container(
          height: 3,
          color: Colors.blue,
        ),
        // Exibir o conteúdo com base na tab selecionada
        _buildTabContent(),
      ],
    );
  }

  Widget _buildTabButton(BottomTab tab, String label) {
    final isSelected = _selectedTab == tab;
    final textColor = isSelected ? Colors.blue : Colors.grey;
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedTab = tab;
        });

        if (tab == BottomTab.Sobre) {
          // Quando a aba "Sobre" é selecionada, atualize o estado do botão para false
          context.read<ProfileButtonState>().updateShowButton(false);
        } else {
          // Quando a aba "Atividades" ou outra for selecionada, atualize o estado do botão para true
          context.read<ProfileButtonState>().updateShowButton(true);
        }
      },
      child: Text(
        label,
        style: TextStyle(color: textColor),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case BottomTab.Atividades:
        return _buildAtividadesTabContent();
      case BottomTab.Sobre:
        return _buildSobreTabContent();
      case BottomTab.Avisos:
        return _buildAvisosTabContent();
      default:
        return Container(); // Pode adicionar um comportamento padrão aqui
    }
  }

  Widget _buildAtividadesTabContent() {
    return AtividadesScreen(
      perfil: widget.perfil,
    );
  }

  Widget _buildSobreTabContent() {
    return SobreScreen(
      perfil: widget.perfil,
    );
  }

  Widget _buildAvisosTabContent() {
    return Container(
      color: Colors.orange, // Conteúdo da aba Avisos e Comunicações
      height: 200,
    );
  }
}
