import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/vmove.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void _playPauseVideo() {
    if (_isPlaying) {
      _controller.pause();
      _controller.seekTo(Duration.zero);
    } else {
      _controller.play();
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
          _controller.value.isInitialized
              ? SizedBox(
                  height: double.infinity,
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
          Positioned(
            bottom: 40,
            left: (MediaQuery.of(context).size.width / 2) - 120,
            child: Column(
              children: [
                Image.asset(
                  'assets/move_text.png',
                  width: 240,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: _playPauseVideo,
                  child: Image.asset(
                    _isPlaying
                        ? 'assets/move_button.png'
                        : 'assets/move_button.png',
                    height: 50,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
