import 'package:flutter/material.dart';

class CustomCardLocalizacao extends StatelessWidget {
  const CustomCardLocalizacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Localização',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/localizacao.png',
                color: Color(0xff7A5CF0),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'São Jorge 2ª Seção, Belo Horizonte - MG, 30451-102',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              height: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/img_mapa.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
