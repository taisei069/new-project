// lib/creative/part4/target.dart

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'ball.dart';

class Target extends BodyComponent {
  final Vector2 position;

  // ターゲットのサイズをここで定義
  final _size = Vector2(2, 2);

  Target({required this.position});

  @override
  void render(Canvas canvas) {
    // 自分自身を描画する処理
    final paint = Paint()..color = Colors.blue;
    // 座標(0,0)を中心に四角形を描く
    final rect = Rect.fromCenter(center: Offset.zero, width: _size.x, height: _size.y);
    canvas.drawRect(rect, paint);
  }

  @override
  Body createBody() {
    // 物理的な形は描画サイズと合わせる
    final shape = PolygonShape()..setAsBoxXY(_size.x / 2, _size.y / 2);
    final fixtureDef = FixtureDef(shape, isSensor: true);
    final bodyDef = BodyDef(
      userData: this,
      position: position,
      type: BodyType.static,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Ball) {
      removeFromParent();
    }
  }
}