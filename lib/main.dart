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
  Future<void> playSound(String assetPath) async {  //method
    await _player.stop(); //ferma eventuale audio precedente
    await _player.setAsset(assetPath);
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
            child: Column(
              children: <Widget> [
                ElevatedButton(
                  onPressed: () => playSound('assets/audio/mysound1.wav'),
                  child: const Text('Play Sound'),
                ),
                ElevatedButton(
                  onPressed: () => playSound('assets/audio/mysound2.wav'),
                  child: const Text('Play Sound'),
                ),
                ElevatedButton(
                  onPressed: () => playSound('assets/audio/mysound3.wav'),
                  child: const Text('Play Sound'),
                ),
              ]
            ),
          )
      ),
    );
  }

}

