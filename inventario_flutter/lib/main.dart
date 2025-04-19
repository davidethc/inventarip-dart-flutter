import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inventario_flutter/providers/inventario_provider.dart';
import 'package:inventario_flutter/providers/theme_provider.dart';
import 'package:inventario_flutter/screens/inventario_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InventarioProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Inventario App',
          theme: themeProvider.currentTheme,
          debugShowCheckedModeBanner: false,
          home: const InventarioPage(),
        );
      },
    );
  }
}
