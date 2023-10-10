import 'package:app_estagio/app/my_app.dart';
import 'package:app_estagio/app/repository/repository.dart';
import 'package:app_estagio/app/screens/perfil_module/perfil_screen.dart';
import 'package:app_estagio/app/screens/perfil_module/perfil_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => Repository()),
        ChangeNotifierProvider<PerfilStore>(
          create: (context) => PerfilStore(context.read()),
        ),
        ChangeNotifierProvider(
            create: (_) => ProfileButtonState()), // Adicione esta linha
      ],
      child: const MyApp(),
    );
  }
}
