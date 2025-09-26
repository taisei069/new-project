import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'dart:ui'; // BackdropFilterのためにインポート
import 'package:google_fonts/google_fonts.dart'; // Google Fontsをインポート
import 'package:safety_go/correct_counter.dart';//カウンター変数import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_go/creative/score_display.dart';
import 'package:safety_go/l10n/app_localizations.dart';
class St_problem_normal_quake15 extends StatefulWidget {
  const St_problem_normal_quake15({super.key});

  @override
  State<St_problem_normal_quake15> createState() =>
      _St_problem_normal_quake15State();
}

class _St_problem_normal_quake15State extends State<St_problem_normal_quake15> {
  late final AudioPlayer _audioPlayer;
  late final List<String> options;
  late final String explanation;
  static const int totalQuestions = 5;
  
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    final t = AppLocalizations.of(context)!;

    options = [
      'A : ' + t.nomal15a,
      'B : ' + t.nomal15b,
      'C : ' + t.nomal15c,
    ];
    explanation = t.nomal15ans;
  }

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _setAudioSource();
  }

  Future<void> _setAudioSource() async {
    try {
      // パスはご自身のプロジェクトに合わせてください
      await _audioPlayer.setAsset('assets/images/audio/jアラート1.mp3');
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
    final t = AppLocalizations.of(context)!;
    final bool isCorrect = index == 1; // 正解は B なので、インデックス 1 が正しい
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
                      isCorrect ? t.ok + '！' : t.ng + '…',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isCorrect ? Colors.green : Colors.red,
                      ),
                    ),
                    /*Text("あなたの回答 $answer",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),//自分の選択肢を表示*/
                  ],
                ),
                Text(t.yourans + " $answer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    softWrap: true, // 自動改行を許可（デフォルトtrueなので省略可）
                    maxLines: null, // 行数制限なしで好きなだけ折り返す
                    ),//自分の選択肢を表示
                const SizedBox(height: 16),
                  Text(
                    explanation,
                    style: TextStyle(fontSize: 20, color: Colors.green),
                 ),
                 Text(t.nomal15,
                style: TextStyle(fontSize: 18, color: Colors.white)),
                 
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
                      context.go(RoutePaths.diffculty_quake);

                    },
                    child: Text(t.nextq),
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
    final t = AppLocalizations.of(context)!;
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
                  t.nomal5q,
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
                      image: AssetImage('assets/images/非常口.png'),
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
                //_buildAudioPlayerControls(),
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
                            onPressed: () {
                              _showExplanation(context, options.indexOf(option));
                              _onQuizFinished(context: context);
                              }// ユーザが選択したものを引数として渡す
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
            questionNumber: 5,                     // ← このファイルは第1問
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
                //_audioPlayer.play();
              }
            },
          ),
        );
      },
    );
  }
}
// ① 解説画面で Finish ボタンを押したときに呼び出す
Future<void> _onQuizFinished({
  required BuildContext context,
}) async {



final uid = FirebaseAuth.instance.currentUser!.uid;
  final docRef = FirebaseFirestore.instance.collection('points').doc(uid);

  final int earnedPoints = (CorrectCounter_nomal_3.correctCount * 2) + 10;

  try {
    // FieldValue.increment を使って簡潔に加算
    await docRef.set({
      'points': FieldValue.increment(earnedPoints)
    }, SetOptions(merge: true));
  } catch (e, stack) {
    debugPrint('ポイント加算失敗: $e');
    debugPrint('$stack');
  }








  if (CorrectCounter_nomal_3.count == 5) {
    // ✅ 全問正解
    await _savePart1Flag();// Firestore へ書き込み
  }

  // 例：ホームへ戻る（経路はお好みで）
}

// ② Firestore にフラグを保存
Future<void> _savePart1Flag() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final docRef =
      FirebaseFirestore.instance.collection('game_progress').doc(uid);

  await FirebaseFirestore.instance.runTransaction((tx) async {
    final snapshot = await tx.get(docRef);

    // 既にデータがある場合は取り出し、無ければ 0 扱い
    final current = (snapshot.data()?['part_2'] ?? 0) as int;

    // 🔸 元の数字が 3 以上なら何もしない
    if (current >= 3) return;

    // 2（あるいは存在しない）ときだけ3 を書き込む
    tx.set(docRef, {'part_2': 3}, SetOptions(merge: true));
  });
}