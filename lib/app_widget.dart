import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:controle_produtos/pages/home/home_page.dart';
import 'package:controle_produtos/pages/login/firstacess/firstacess_page.dart';
import 'package:controle_produtos/pages/login/forgetpass/forgetpass_page.dart';
import 'package:controle_produtos/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'src/shared/themes/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'App Widget',
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/forgetpass': (context) => const ForgetPassPage(),
        '/firstacess': (context) => const FirstAcessPage()
      },
    );
  }
}

Future<Widget>? tokenSalvo() async {
  final prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';

  if (token.isEmpty) {
    return const LoginPage();
  } else {
    return const HomePage();
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({key, this.title}) : super(key: key);
  final title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen(context);
  }
}

Widget _introScreen(BuildContext context) {
  return Stack(
    children: <Widget>[
      FlutterSplashScreen(
        duration: const Duration(seconds: 1),
        nextScreen: FutureBuilder(
            future: tokenSalvo(),
            // tokenSalvo(),
            builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return snapshot.data ?? const SizedBox();
              }
            }),
        splashScreenBody: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.red],
              ),
            ),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            child: Stack(children: [
              const Center(
                child: Text('Product control',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontFamily: 'Orbitron')),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/girafffus_logo.jpg',
                          height: MediaQuery.of(context).size.height * 0.15),
                      const Text('@kaiomacedo_m',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    ],
  );
}
