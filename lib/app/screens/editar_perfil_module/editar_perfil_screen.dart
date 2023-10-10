import 'package:app_estagio/app/models/moderadores_model.dart';
import 'package:app_estagio/app/models/perfil_model.dart';
import 'package:app_estagio/app/screens/editar_perfil_module/widgets/custom_text_field.dart';
import 'package:app_estagio/app/screens/perfil_module/perfil_store.dart';
import 'package:app_estagio/app/screens/perfil_module/widgets/custom_elevated_button.dart';
import 'package:app_estagio/app/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarPerfilScreen extends StatefulWidget {
  final PerfilModel perfil;

  const EditarPerfilScreen({required this.perfil, Key? key}) : super(key: key);

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  final _nomeController = TextEditingController();
  final _bioController = TextEditingController();
  final _localizacaoController = TextEditingController();
  final _admGeralController = TextEditingController();
  final _moderadorController = TextEditingController();
  final List<String> moderadores = []; // Lista de moderadores
  @override
  void initState() {
    super.initState();
    final perfil = widget.perfil;
    _nomeController.text = perfil.nome ?? 'Erro ao acessar o nome';
    _bioController.text = perfil.bio ?? 'Erro ao acessar a bio';
    _localizacaoController.text =
        perfil.localizacao ?? 'Erro ao acessar a localização';
    _admGeralController.text = perfil.admGeral ?? 'Erro ao cessar o adm geral';
    moderadores.addAll(perfil.moderadores!.map((moderador) => moderador.nome));
  }

  @override
  Widget build(BuildContext context) {
    final perfilStore = context.watch<PerfilStore>();
    final perfil = widget.perfil;
    final altura = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0, // Remova a sombra
        backgroundColor: Colors.white, // Cor de fundo branca
        foregroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Editar perfil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Cor do texto
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final newPerfil = PerfilModel(
                fotoPerfil: perfil.fotoPerfil,
                fotoBanner: perfil.fotoBanner,
                nome: perfil.nome,
                bio: perfil.bio,
                localizacao: perfil.localizacao,
                admGeral: perfil.admGeral,
                email: perfil.email,
                whatsapp: perfil.whatsapp,
                cheked: perfil.cheked,
                horarioAtendimento: perfil.horarioAtendimento,
                atividades: perfil.atividades,
                edificios: perfil.edificios,
                entrouEm: perfil.entrouEm,
                nomePerfil: perfil.nomePerfil,
                moderadores: perfil.moderadores,
              );

              newPerfil.nome = _nomeController.text;
              newPerfil.bio = _bioController.text;
              newPerfil.localizacao = _localizacaoController.text;
              newPerfil.admGeral = _admGeralController.text;
              newPerfil.moderadores = moderadores
                  .map((nomeModerador) => ModeradoresModel(nome: nomeModerador))
                  .toList();

              context.read<PerfilStore>().updatePerfil(newPerfil);
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Imagem de perfil',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Container(
                child: Center(
                  child: Stack(children: [
                    Center(child: Image.asset(perfil.fotoPerfil!)),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: 40,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          'assets/images/icon_camera.png',
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              CustomTitleCardTextField(text: 'Nome'),
              // Text(
              //   'Nome',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              // ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(controller: _nomeController),
              SizedBox(
                height: 25,
              ),
              CustomTitleCardTextField(text: 'Bio'),
              // Text(
              //   'Bio',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              // ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: _bioController,
              ),
              SizedBox(
                height: 25,
              ),
              CustomTitleCardTextField(text: 'Localização'),
              // Text(
              //   'Localização',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              // ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: _localizacaoController,
              ),
              SizedBox(
                height: 25,
              ),
              CustomTitleCardTextField(text: 'Administrador Geral'),
              // Text(
              //   'Administrador Geral',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              // ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: _admGeralController,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  CustomTitleCardTextField(text: 'Moderadores'),
                  // Text(
                  //   'Moderadores',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  // ),
                  Spacer(),
                  CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          final novoModerador = _moderadorController.text;
                          if (novoModerador.isNotEmpty) {
                            moderadores.add(novoModerador);
                            _moderadorController.clear();
                          }
                        });
                      },
                      text: 'Adicionar')
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(controller: _moderadorController),
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       final novoModerador = _moderadorController.text;
                  //       if (novoModerador.isNotEmpty) {
                  //         moderadores.add(novoModerador);
                  //         _moderadorController.clear();
                  //       }
                  //     });
                  //   },
                  //   icon: Icon(Icons.add),
                  // ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: moderadores.length,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: CustomTextField(
                        controller:
                            TextEditingController(text: moderadores[index]),
                        showClearButton: true,
                        onPressed: () {
                          setState(() {
                            moderadores.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
