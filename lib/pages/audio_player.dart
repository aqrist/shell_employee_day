import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({
    super.key,
  });

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> with TickerProviderStateMixin {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  double _buttonHeight = 300;
  double _buttonPosition = 32;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  void _playPauseAudio() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
      setState(() {
        _buttonHeight = 300;
        _buttonPosition = 32;
      });
    } else {
      await _audioPlayer.play(AssetSource('focus_sm.mp3'));
      setState(() {
        _buttonHeight = 200;
        _buttonPosition = 100;
      });
    }

    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Image.asset(
                    'assets/logo.png',
                    width: 300,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    top: _buttonPosition,
                    child: Column(
                      children: [
                        // AnimatedSwitcher for switching between button and sound wave
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: _isPlaying
                              ? SizedBox(
                                  width: MediaQuery.of(context).size.width - 200,
                                  child: Center(
                                    child: Lottie.asset(
                                        'assets/animate.json'),
                                  ),
                                )
                              : SizedBox(
                                  width: 300,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/button.png',
                                      key: const ValueKey('button'),
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 16),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          child: GestureDetector(
                            onTap: _playPauseAudio,
                            child: Image.asset(
                              _isPlaying
                                  ? 'assets/stop_button.png'
                                  : 'assets/press_button.png',
                              height: _buttonHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
