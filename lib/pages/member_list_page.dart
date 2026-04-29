import 'package:flutter/material.dart';
import '../models/member.dart';
import '../widgets/member_tile.dart';
import '../data/members.dart';
import 'package:ecobook/services/audio_manager.dart';

class MemberListPage extends StatefulWidget {
  const MemberListPage({super.key});

  @override
  State<MemberListPage> createState() => _MemberListPageState();
}

class _MemberListPageState extends State<MemberListPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late List<String> bands;
  bool isPlaying = true;
  
  // 為每個band定義漸變顏色
  final Map<String, List<Color>> bandGradients = {
    'Poppin\'Party': [const Color(0xFFFF6B6B), const Color.fromARGB(255, 247, 118, 86)],
    'RAISE A SUILEN': [const Color(0xFF4ECDC4), const Color(0xFF44A08D)],
    'Morfonica': [const Color(0xFF45B7D1), const Color(0xFF0084FF)],
    'Hello, Happy World!': [const Color.fromARGB(255, 255, 247, 21), const Color.fromARGB(255, 255, 193, 7)],
    'Afterglow': [const Color.fromARGB(255, 154, 33, 33), const Color.fromARGB(255, 210, 46, 46)],
    'Roselia': [const Color(0xFF9B59B6), const Color(0xFFBB8FCE)],
    'Pastel＊Palettes': [const Color.fromARGB(255, 231, 133, 215), const Color.fromARGB(255, 244, 177, 229)],
  };
  final Map<String, String> bandMusic = {
  'Poppin\'Party': 'audio/bgmPPP.mp3',
  'Roselia': 'audio/bgm.mp3',
  'RAISE A SUILEN': 'audio/bgmRAS.mp3',
  'Morfonica': 'audio/bgmM.mp3',
  'Hello, Happy World!': 'audio/bgmH.mp3',
  'Afterglow': 'audio/bgmA.mp3',
  'Pastel＊Palettes': 'audio/bgmPP.mp3',
};

  @override
  void initState() {
    super.initState();
    bands = membersByBand.keys.toList();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    String band = bands[_tabController.index];
    final musicPath = bandMusic[band];

    if (musicPath != null) {
      AudioManager().play(musicPath);
      }
    });
    _tabController = TabController(length: bands.length, vsync: this);
    _tabController.addListener(() async  {
    if (_tabController.indexIsChanging) return;

    String band = bands[_tabController.index];

    final musicPath = bandMusic[band];

    if (musicPath != null) {
      await AudioManager().play(musicPath);
    }

    setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentGradient = bandGradients[bands[_tabController.index]] ?? [Colors.indigo, Colors.blue];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Members(?'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: currentGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              //transform: GradientRotation(_tabController.index * 0.5), // 旋轉
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: bands
              .map((band) => Tab(text: band))
              .toList(),
        ),
        actions: [
  IconButton(
    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
    onPressed: () async {
      if (isPlaying) {
        await AudioManager().pause();
      } else {
        await AudioManager().resume();
      }

      setState(() {
        isPlaying = !isPlaying;
      });
    },
  ),
],
      ),
      body: TabBarView(
        controller: _tabController,
        children: bands
            .map((band) => _buildMemberList(membersByBand[band]!))
            .toList(),
      ),
    );
  }

  Widget _buildMemberList(List<Member> members) {
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        return MemberTile(member: members[index]);
      },
    );
  }
}