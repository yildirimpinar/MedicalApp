import 'package:flutter/material.dart';
import 'package:teletip_app/pages/homePage/home_tabs.dart';
import 'package:teletip_app/pages/loginPage/login_page.dart';
import 'package:teletip_app/pages/messagePage/chat_list.dart';
import 'package:teletip_app/pages/registerPage/doctor_register.dart';
import 'package:teletip_app/pages/registerPage/register_page.dart';

import 'package:teletip_app/services/shared_service.dart';

Widget _default = const LoginPage();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool _result = await SharedService.isLoggedIn();

  if (_result) {
    _default = const HomePage();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tele Tıp',
      routes: {
        '/': (context) => _default,
        '/home': (context) => const HomePage(),
        '/userLogin': (context) => const LoginPage(),
        '/userRegister': (context) => const RegisterPage(),
        '/details': (context) => const MessagePage(),
        '/doctorRegister': (context) => const DoctorRegisterPage()
      },
    );
  }
}
