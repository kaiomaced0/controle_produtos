import 'package:controle_produtos/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

Widget titulo(BuildContext context) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image(
                    image: const AssetImage('assets/images/oito-marco.jpg'),
                    height: MediaQuery.of(context).size.height * 0.1)
              ],
            ),
          ],
        ),
      ),
      AppBar(
        forceMaterialTransparency: true,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == 'logout') {
                _logout(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'logout',
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Logout'),
                ),
              ),
            ],
          ),
        ],
        automaticallyImplyLeading: false,
      )
    ],
  );
}

void _logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  Vibration.vibrate(duration: 100);
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const LoginPage()),
    (Route<dynamic> route) => false,
  );
}
