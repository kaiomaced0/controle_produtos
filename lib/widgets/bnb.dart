import 'package:controle_produtos/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

int _currentBnb = 0;
BottomNavigationBar bnb(context, int? current) {
  return BottomNavigationBar(
      backgroundColor: const Color(0xFF49454E),
      unselectedItemColor: const Color(0xFFFFFFFF),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cartao')
      ],
      currentIndex: _currentBnb,
      onTap: (value) async {
        // Usuario? user = await Usuario.obterDadosUsuario();
        String? rotaAtual = ModalRoute.of(context)?.settings.name;

        if (current != null) {
          Vibration.vibrate(duration: 100);

          Navigator.pop(context);
        }
        if (value == 0) {
          Vibration.vibrate(duration: 100);
          if (rotaAtual == '/home') {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => route.isFirst,
            );
            _currentBnb = 0;
          } else {
            _currentBnb = 0;
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => route.isFirst,
            );
          }
        }
        // if (value == 1) {
        //   Vibration.vibrate(duration: 100);
        //   _currentBnb = 1;
        //   if (rotaAtual == '/cartao') {
        //   } else if (rotaAtual == '/home') {
        //     Navigator.of(context).pushAndRemoveUntil(
        //       MaterialPageRoute(
        //           builder: (context) => CartaoPage(
        //               u: user,
        //               listaConsulta: c,
        //               listaExame: e,
        //               listaUltrassonografia: u)),
        //       (Route<dynamic> route) => route.isFirst,
        //     );
        //   } else {
        //     Navigator.of(context).pushAndRemoveUntil(
        //       MaterialPageRoute(
        //           builder: (context) => CartaoPage(
        //               u: user,
        //               listaConsulta: c,
        //               listaExame: e,
        //               listaUltrassonografia: u)),
        //       (Route<dynamic> route) => route.isFirst,
        //     );
        //   }
        // }
      });
}
