import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shell_employee_day/pages/audio_player.dart';
import 'package:shell_employee_day/pages/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shell Emplpoyee Day',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const SwitchPage(),
    );
  }
}

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shell Employee day'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AudioPage()));
                },
                child: const Text('Audio Player'),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VideoPage()));
                },
                child: const Text('Video Player'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
