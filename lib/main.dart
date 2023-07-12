import 'package:flutter/material.dart';
import 'package:suitmedia/Screen/First_Screen.dart';
import 'package:provider/provider.dart';

import 'Provider/Name_Provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NameProvider>(
          create: (_) => NameProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstScreen(),
    );
  }
}
