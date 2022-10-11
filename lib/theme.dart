import 'package:theme_provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<ThemeMode> _noti = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _noti,
      builder: (_, mode, __) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode, // Decides which theme to show, light or dark.
          home: Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () => _noti.value = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
                child: Text('Toggle Theme'),
              ),
            ),
          ),
        );
      },
    );
  }
}