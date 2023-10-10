import 'package:app_estagio/app/screens/editar_perfil_module/editar_perfil_screen.dart';
import 'package:app_estagio/app/screens/perfil_module/perfil_store.dart';
import 'package:app_estagio/app/screens/perfil_module/widgets/body_perfil.dart';
import 'package:app_estagio/app/screens/perfil_module/widgets/custom_elevated_button.dart';
import 'package:app_estagio/app/states/perfil_state.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ProfileButtonState extends ChangeNotifier {
  bool _showButton = true;

  bool get showButton => _showButton;

  void updateShowButton(bool value) {
    _showButton = value;
    notifyListeners();
  }
}

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PerfilStore>().getPerfil();
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<PerfilStore>();
    final state = store.value;

    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildProfileWidget(state),
    );
  }

  Widget _buildProfileWidget(
    PerfilState state,
  ) {
    if (state is LoadingPerfilState) {
      return Center(child: CircularProgressIndicator());
    } else if (state is SucessPerfilState) {
      bool showButton = true;
      final perfil = state.perfil;
      return SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 375,
                      width: double.infinity,
                      child: Stack(children: [
                        Image.asset(
                          perfil.fotoBanner!,
                          height: 212,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50, left: 10),
                            child: Image.asset(perfil.fotoPerfil!),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100, right: 10),
                            child: Consumer<ProfileButtonState>(
                              // Use o Consumer para acessar o estado do botão
                              builder: (context, buttonState, _) {
                                return Visibility(
                                  visible: buttonState.showButton,
                                  child: CustomElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditarPerfilScreen(
                                                  perfil: perfil),
                                        ),
                                      );
                                    },
                                    text: 'Editar Perfil',
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 275, left: 15),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        perfil.nome ?? 'Nome indisponivel',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      perfil.cheked == true
                                          ? Image.asset(
                                              'assets/images/icon_chek_amarelo.png')
                                          : Container(),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    perfil.bio ?? 'Bio indisponivel',
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/localizacao.png',
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            perfil.localizacao ??
                                                'Localização Indisponivel',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/calendario.png',
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Entrou em ${perfil.entrouEm}' ??
                                                'Data indisponivel',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                    BodyPerfil(
                      perfil: perfil,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    } else if (state is ErrorPerfilState) {
      return Text(state.message);
    } else {
      return Container();
    }
  }
}
