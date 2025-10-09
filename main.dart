import 'package:flutter/material.dart';
import 'login.dart';

void main() async {
    WidgetFlutterBinding.ensureInitialisation();
    await Firebase.InitialiseApp();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Add this line
      initialRoute: 'login',
      routes: {
        'login' : (context) => const MyLogin(),
      },
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Montserrat',
    ),
    );
  }
}
