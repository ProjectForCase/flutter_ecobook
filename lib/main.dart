import 'package:flutter/material.dart';
//import 'models/member.dart';
import 'pages/member_list_page.dart';
import 'services/audio_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await AudioManager().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GarupaArtists',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MemberListPage(),
    );
  }
}