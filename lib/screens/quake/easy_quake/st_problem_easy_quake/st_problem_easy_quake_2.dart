import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'quiz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safety_go/l10n/app_localizations.dart';

class St_pro_easy_quake2 extends StatelessWidget {
  const St_pro_easy_quake2({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final List<String?> userAnswers = extra['userAnswers'];
    final List<Quiz_1> quizList = extra['quizList'];

    int correctCount = 0;
    for (int i = 0; i < quizList.length; i++) {
      if (userAnswers[i] == quizList[i].correctAnswer) {
        correctCount++;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.exandre),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFF1F8E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- 各問題の結果 ---
                ...List.generate(quizList.length, (i) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Q${i + 1}. ${quizList[i].question}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            t.yourans + '：${userAnswers[i] ?? t.notans}',
                            style: const TextStyle(color: Colors.black87),
                          ),
                          Text(
                            t.ok + '：${quizList[i].correctAnswer}',
                            style: const TextStyle(color: Colors.teal),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            t.ans + '：${quizList[i].explanation}',
                            style: const TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 12),

                // --- 正答率表示 ---
                Center(
                  child: Text(
                    t.per + '：${((correctCount / quizList.length) * 100).toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // --- 現在のポイント表示 ---
                const Center(child: PointDisplay()),

                const SizedBox(height: 32),

                // --- Finishボタン ---
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await _onQuizFinished(
                          context: context,
                          correctCount: correctCount,
                          totalCount: quizList.length,
                        );
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Finish'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Firestore の points コレクションから現在のポイントを表示
class PointDisplay extends StatelessWidget {
  const PointDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return const Text('ログインしていません');

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('points').doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('読み込み中...');
        final data = snapshot.data!.data() as Map<String, dynamic>?;
        final points = data?['points'] ?? 0;
        return Text(
          '所持ポイント: $points',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        );
      },
    );
  }
}

/// Finishボタン押下後の処理
Future<void> _onQuizFinished({
  required BuildContext context,
  required int correctCount,
  required int totalCount,
}) async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final docRef = FirebaseFirestore.instance.collection('points').doc(uid);

  final int earnedPoints = (correctCount * 2) + 10;

  try {
    // FieldValue.increment を使って簡潔に加算
    await docRef.set({
      'points': FieldValue.increment(earnedPoints)
    }, SetOptions(merge: true));
  } catch (e, stack) {
    debugPrint('ポイント加算失敗: $e');
    debugPrint('$stack');
  }

  // 全問正解ならフラグ保存
  if (correctCount == totalCount) {
    await _savePart1Flag();
  }

  // クイズ終了後の画面に戻る
  context.go('/diffculty_quake');
}

/// Firestoreにフラグを書き込む処理（全問正解時のみ）
Future<void> _savePart1Flag() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final docRef = FirebaseFirestore.instance.collection('game_progress').doc(uid);

  await docRef.set({'part_1': 1}, SetOptions(merge: true));
}
