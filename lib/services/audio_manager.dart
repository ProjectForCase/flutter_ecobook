import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;

  AudioManager._internal();

  final AudioPlayer _player = AudioPlayer();

  String? _currentTrack;

  Future<void> init() async {
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.setVolume(0.5);
  }

  Future<void> play(String path) async {
    if (_currentTrack == path) return; // ❗避免重複播放

    await fadeOut();

    await _player.stop();
    await _player.play(AssetSource(path));

    _currentTrack = path;

    await fadeIn();
  }

  Future<void> pause() async => _player.pause();
  Future<void> resume() async => _player.resume();

  Future<void> setVolume(double v) async {
    await _player.setVolume(v);
  }

  Future<void> dispose() async {
    await _player.dispose();
  }

  Future<void> fadeIn() async {
    for (double v = 0; v <= 0.5; v += 0.05) {
      await _player.setVolume(v);
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }

  Future<void> fadeOut() async {
    for (double v = 0.5; v >= 0; v -= 0.05) {
      await _player.setVolume(v);
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }
}