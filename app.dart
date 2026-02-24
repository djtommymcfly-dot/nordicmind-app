import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/chat/chat_screen.dart';

class NordicMindApp extends StatelessWidget {
  const NordicMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NordicMind',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      supportedLocales: const [
        Locale('en'),
        Locale('sv'),
        Locale('fi'),
        Locale('da'),
        Locale('no'),
        Locale('is'),
        Locale('pt'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const ChatScreen(),
    );
  }
}
