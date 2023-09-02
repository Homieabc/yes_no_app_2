import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_2/config/themes/app_theme.dart';
import 'package:yes_no_app_2/presentation/Screens/chat/chat_screen.dart';
import 'package:yes_no_app_2/presentation/providers/chat_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        )
      ],
      child: MaterialApp(
        theme: AppTheme(selectedColor: 0).theme(),
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      ),
    );
  }
}
