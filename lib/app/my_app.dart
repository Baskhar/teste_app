import 'package:app_estagio/app/routs.dart';
import 'package:app_estagio/app/screens/home_screen.dart';
import 'package:app_estagio/app/screens/perfil_module/perfil_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routerDelegate: routes.routerDelegate,
      // routeInformationParser: routes.routeInformationParser,
      // routeInformationProvider: routes.routeInformationProvider,
      //home: PerfilScreen(),
      home: HomeScreen(),
    );
  }
}
