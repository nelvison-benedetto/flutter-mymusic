import 'package:flutter/material.dart';
import 'dart:math';

import 'package:just_audio/just_audio.dart';

void main(){ runApp( MainPage()); }

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  final AudioPlayer _player = AudioPlayer();

  Future<void> playSound() async {
    await _player.setAsset('assets/audio/mysound1.wav');
    _player.play();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar : AppBar(),
          body : SafeArea(
            child: Center(
              child: ElevatedButton(
                onPressed: playSound,
                child: const Text('Play Sound'),
              ),
            ),
          )
      ),
    );
  }

}

