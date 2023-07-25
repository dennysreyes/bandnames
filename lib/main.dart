import 'package:band_app/Services/socket_service.dart';
import 'package:band_app/pages/home.dart';
import 'package:band_app/pages/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SocketService(),
        )
      ],
      child: MaterialApp(
        initialRoute: 'home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        title: 'Material App',
        routes: {
          'home': (_) => const Home(),
          'status': (_) => const StatusPage()
        },
      ),
    );
  }
}
