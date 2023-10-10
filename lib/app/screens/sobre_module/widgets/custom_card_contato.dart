import 'package:app_estagio/app/screens/perfil_module/perfil_store.dart';
import 'package:app_estagio/app/states/perfil_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomCardContato extends StatefulWidget {
  const CustomCardContato({Key? key}) : super(key: key);

  @override
  State<CustomCardContato> createState() => _CustomCardContatoState();
}

class _CustomCardContatoState extends State<CustomCardContato> {
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
    return Container(height: 100, child: _buildProfileWidget(state));
  }

  Widget _buildProfileWidget(PerfilState state) {
    if (state is SucessPerfilState) {
      final perfil = state.perfil;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contato',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Image.asset('assets/images/icon_whatsapp.png'),
              SizedBox(
                width: 5,
              ),
              Text(perfil.whatsapp ?? 'Numero indisponivel'),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Image.asset('assets/images/icon_email.png'),
              SizedBox(
                width: 5,
              ),
              Text(perfil.email ?? 'Email indisponivel'),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
