// lib/creative/part4/game_page.dart

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:safety_go/creative/part4/throwing_game.dart'; 

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('投擲ゲーム'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: GameWidget(
        game: ThrowingGame() ..debugMode = true,
      ),
    );
  }
}