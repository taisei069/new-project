import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'quiz.dart'; // Quiz モデル（question, correctAnswer, explanation）を定義しているファイル
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class St_pro_easy_quake4 extends StatelessWidget {
  const St_pro_easy_quake4({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final List<String?> userAnswers = extra['userAnswers'];
    final List<Quiz_2> quizList = extra['quizList'];

    int correctCount = 0;
    for (int i = 0; i < quizList.length; i++) {
      if (userAnswers[i] == quizList[i].correctAnswer) {
        correctCount++;
      }
    }

    final double scorePercent =
        (correctCount / quizList.length * 100).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: const Text('解説と結果'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF1F8E9), Color(0xFFE3F2FD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ...List.generate(quizList.length, (i) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                          const SizedBox(height: 6),
                          Text('あなたの答え：${userAnswers[i] ?? "未回答"}'),
                          Text('正解：${quizList[i].correctAnswer}'),
                          const SizedBox(height: 6),
                          Text(
                            '解説：${quizList[i].explanation}',
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 24),
                Text(
                  '正解率：${scorePercent.toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {
                    _onQuizFinished(
                      context: context,
                      correctCount: correctCount,
                      totalCount: quizList.length,
                    );
                  },
                  icon: const Icon(Icons.check),
                  label: const Text('Finish'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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

// Finish時の処理（全問正解でFirestoreに進捗保存）
Future<void> _onQuizFinished({
  required BuildContext context,
  required int correctCount,
  required int totalCount,
}) async {
  if (correctCount == totalCount) {
    await _savePart1Flag(); // Firestore に書き込み
  }

  context.go('/diffculty_quake');
}

// Firestoreに正解フラグを保存
Future<void> _savePart1Flag() async {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final docRef =
      FirebaseFirestore.instance.collection('progress').doc(uid);

  await FirebaseFirestore.instance.runTransaction((tx) async {
    final snapshot = await tx.get(docRef);
    final current = (snapshot.data()?['part_1'] ?? 0) as int;

    if (current >= 2) return;

    tx.set(docRef, {'part_1': 2}, SetOptions(merge: true));
  });
}
