import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PointService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPoints(int additionalPoints) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      print('ポイント加算失敗: ユーザーがログインしていません');
      return;
    }

    // ✅ コレクション名を `points` に変更
    final docRef = _firestore.collection('points').doc(uid);

    try {
      await _firestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(docRef);
        int currentPoints = 0;

        if (!snapshot.exists) {
          transaction.set(docRef, {'points': additionalPoints});
          return;
        }

        final data = snapshot.data();
        if (data != null && data['points'] != null) {
          final pointsValue = data['points'];
          if (pointsValue is int) {
            currentPoints = pointsValue;
          } else if (pointsValue is double) {
            currentPoints = pointsValue.toInt();
          } else if (pointsValue is String) {
            currentPoints = int.tryParse(pointsValue) ?? 0;
          }
        }

        final newPoints = currentPoints + additionalPoints;
        transaction.set(docRef, {'points': newPoints}, SetOptions(merge: true));
      });
    } catch (e, stack) {
      print('ポイント加算のトランザクション失敗: $e');
      print('エラーの型: ${e.runtimeType}');
      print('スタックトレース:\n$stack');
    }
  }
}
