import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'ball.dart';
import 'target.dart';
import 'ground.dart';

class ThrowingGame extends Forge2DGame with PanDetector {
  late Target target;
@override
  Color backgroundColor() => const Color(0xFF333333); // 暗い灰色
  ThrowingGame() : super(gravity: Vector2(0, 15.0)); // 下向きの重力を設定

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // 地面を追加
    add(Ground(size: screenToWorld(camera.viewport.size)));

    // ターゲットを生成して追加
    final targetPosition = Vector2(size.x / 2, size.y * 0.3);
    target = Target(position: targetPosition);
    add(target);
  }

  // スワイプ（ドラッグ）終了を検知
  @override
  void onPanEnd(DragEndInfo info) {
    super.onPanEnd(info);

    // スワイプの速度を取得
    final velocity = info.velocity;

    // 画面下中央からボールを投げる
    final startPosition = Vector2(size.x / 2, size.y * 0.9);
    final ball = Ball(position: startPosition);
    add(ball);

    // ボールに力を加える（スワイプの速度を調整して使用）
    // y方向の速度はマイナス（上向き）にし、x方向の速度も調整
    final throwImpulse = Vector2(velocity.x * 0.005, -velocity.y.abs() * 0.006);
    ball.body.applyLinearImpulse(throwImpulse);
  }

  // 画面のどこかをタップされた時の処理（今回は使わない）
  @override
  void onPanStart(DragStartInfo info) {}
  @override
  void onPanUpdate(DragUpdateInfo info) {}
}