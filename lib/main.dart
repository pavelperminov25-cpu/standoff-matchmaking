import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/theme/app_theme.dart';
import 'features/home/presentation/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  
  runApp(const StandoffMatchmakingApp());
}

class StandoffMatchmakingApp extends StatelessWidget {
  const StandoffMatchmakingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Standoff Matchmaking',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
