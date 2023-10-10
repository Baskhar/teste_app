import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool
      showClearButton; // Parâmetro para controlar a visibilidade do botão
  final VoidCallback? onPressed; // Parâmetro opcional para ação do botão
  final bool enabled; // Parâmetro opcional para habilitar/desabilitar a edição

  const CustomTextField({
    Key? key,
    required this.controller,
    this.showClearButton = false,
    this.onPressed,
    this.enabled = true, // Padrão para habilitado
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: TextField(
                controller: controller,
                enabled: enabled, // Habilita ou desabilita a edição
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 15),
                ),
              ),
            ),
          ),
          Visibility(
            visible: showClearButton,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.clear,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
