import 'package:app_estagio/app/screens/pagina2.dart';
import 'package:app_estagio/app/screens/pagina3.dart';
import 'package:app_estagio/app/screens/pagina4.dart';
import 'package:app_estagio/app/screens/perfil_module/perfil_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice da página selecionada

  // Lista de páginas para exibir
  final List<Widget> _pages = [
    PerfilScreen(), // Página inicial, a PerfilScreen
    Pagina2(), // Outras páginas aqui
    Pagina3(),
    Pagina4(),
  ];

  // Função para alternar entre as páginas
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Página atual exibida
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Índice da página selecionada
        onTap: _onItemTapped, // Função chamada quando um item é tocado
        type: BottomNavigationBarType
            .fixed, // Isso é importante para manter o fundo cinza visível
        selectedItemColor: Colors.blue, // Cor do item selecionado
        unselectedItemColor: Colors.grey, // Cor do item não selecionado
        items: [
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == 0 ? Colors.grey : Colors.transparent,
                borderRadius: BorderRadius.circular(20), // Borda arredondada
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/navigator/navigator_localizacao.png',
                width: 32,
                color: _selectedIndex == 0 ? Colors.black : null,
              ),
            ),
            label: '', // Rótulo para a primeira página
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == 1 ? Colors.grey : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/navigator/navigator_procura.png',
                width: 32,
                color: _selectedIndex == 1 ? Colors.black : null,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == 2 ? Colors.grey : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/navigator/navigator_notificatio.png',
                width: 32,
                color: _selectedIndex == 2 ? Colors.black : null,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: _selectedIndex == 3 ? Colors.grey : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/navigator/navigator_mensage.png',
                width: 32,
                color: _selectedIndex == 3 ? Colors.black : null,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
