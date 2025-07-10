import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'dart:ui'; // BackdropFilterのためにインポート
import 'package:google_fonts/google_fonts.dart'; // Google Fontsをインポート
import 'package:safety_go/correct_counter.dart';//カウンター変数import
import 'package:safety_go/creative/score_display.dart';
class St_problem_normal_quake13 extends StatefulWidget {
  const St_problem_normal_quake13({super.key});

  @override
  State<St_problem_normal_quake13> createState() =>
      _St_problem_normal_quake13State();
}

class _St_problem_normal_quake13State extends State<St_problem_normal_quake13> {
  late final AudioPlayer _audioPlayer;
  final List<String> options = ['A:安全に避難するための出口', 'B津波から安全に避難できる場所', 'C滑り台を反対から登ろう'];
  final String explanation = "これは選択肢の解説です。正解は B です。津波が起きた時に避難する場所を教えてくれます。";
  static const int totalQuestions = 5;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _setAudioSource();
  }

  Future<void> _setAudioSource() async {
    try {
      // パスはご自身のプロジェクトに合わせてください
      await _audioPlayer.setAsset('assets/images/audio/大津波警報1.mp3');
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _showExplanation(BuildContext context ,int index) {// index（ユーザが選択したもの）を引数として受け取る
    final bool isCorrect = index == 1; // 正解は B なので、インデックス 1 が正しいA
    String answer = options[index];//options[index]を$で繋げようとするとできなかったのでanswerに代入した
    _audioPlayer.stop();
    if (isCorrect == true) {//正解したらカウンター変数を１増やす
      CorrectCounter_nomal_3.increment();
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.transparent, // 背景を透過
      builder: (context) => ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //ここから答えの正誤とユーザの選択表示================================
                Row(
                  children: [
                    Icon(
                      isCorrect ? Icons.circle : Icons.close,
                      color: isCorrect ? Colors.green : Colors.red,
                      size: 28,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isCorrect ? '正解！' : '不正解…',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    Text("あなたの回答:$answer",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),//自分の選択肢を表示
                  ],
                ),
                const SizedBox(height: 16),
                  Text(
                    explanation,
                    style: GoogleFonts.orbitron(fontSize: 18, color: Colors.white),
                 ),
                SizedBox(height: 24),
                //ここまで================================
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00BFFF), // ディープスカイブルー
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: GoogleFonts.orbitron(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      context.go(RoutePaths.st_pro_normal_quake14);
                    },
                    child: Text('次の問題へ'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D1B2A),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Q U E S T",
          style: GoogleFonts.orbitron(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 4,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: [
        Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF001f3f), // ネイビー
              Color(0xFF0D1B2A), // ダークブルー
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  "問題文3：次の記号の正しい意味は？",
                  style: GoogleFonts.orbitron(
                      fontSize: 22, color: Colors.white, height: 1.4),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/images/大規模な火事.png'),
                      fit: BoxFit.contain,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF00BFFF).withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                _buildAudioPlayerControls(),
                const Spacer(),
                ...options.map((option) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 18),
                              backgroundColor: Colors.white.withOpacity(0.15),
                              foregroundColor: Colors.white,
                              side: BorderSide(
                                  color: Colors.white.withOpacity(0.3)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              textStyle: GoogleFonts.rajdhani(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            child: Text(option),
                            onPressed: () => _showExplanation(context, options.indexOf(option)),// ユーザが選択したものを引数として渡す
                          ),
                        ),
                      ),
                    )),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      // ▼追加したスコア表示（右上固定）
        Positioned(
          top: 0,
          right: 0,
          child: ScoreDisplay(
            questionNumber: 3,                     // ← このファイルは第1問
            score: CorrectCounter_nomal_3
                .correctCount,                    // ← 現在の正解数
            totalQuestions: totalQuestions,       // ← 全問題数
          ),
        ),
      ],
    ),

    );
  }

  Widget _buildAudioPlayerControls() {
    return StreamBuilder<PlayerState>(
      stream: _audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final playing = playerState?.playing ?? false;

        return Center(
          child: IconButton(
            icon: Icon(playing
                ? Icons.pause_circle_outline_rounded
                : Icons.play_circle_outline_rounded),
            iconSize: 80.0,
            color: Color(0xFF00BFFF),
            splashColor: Color(0xFF00BFFF).withOpacity(0.5),
            onPressed: () {
              if (playing) {
                _audioPlayer.pause();
              } else {
                if (_audioPlayer.processingState == ProcessingState.completed) {
                  _audioPlayer.seek(Duration.zero);
                }
                _audioPlayer.play();
              }
            },
          ),
        );
      },
    );
  }
}