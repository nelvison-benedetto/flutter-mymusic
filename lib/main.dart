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

  Expanded myMethodXCustomBtn({required Color color, required int xSoundFile}){
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          //backgroundColor: Colors.orange,
          backgroundColor: color,
        ),
        onPressed: () => playSound('assets/audio/mysound${xSoundFile}.wav'),
        child: const Text('Play Sound'),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar : AppBar(),
          body : SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                myMethodXCustomBtn(color: Colors.yellow, xSoundFile: 1),
                myMethodXCustomBtn(color: Colors.orange, xSoundFile: 2),
                myMethodXCustomBtn(color: Colors.red, xSoundFile: 3)
              ]
            ),
          )
      ),
    );
  }

}

