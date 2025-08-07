// lib/creative/part4/ball.dart

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'target.dart';

class Ball extends BodyComponent {
  final Vector2 position;
  final double _radius = 0.5;

  Ball({required this.position});

  @override
  void render(Canvas canvas) {
    // 自分自身を描画する処理
    final paint = Paint()..color = Colors.red;
    // 座標(0,0)を中心に円を描く
    canvas.drawCircle(Offset.zero, _radius, paint);
  }

  @override
  Body createBody() {
    final shape = CircleShape()..radius = _radius;
    final fixtureDef = FixtureDef(
      shape,
      restitution: 0.4,
      density: 1.0,
      friction: 0.5,
    );
    final bodyDef = BodyDef(
      userData: this,
      position: position,
      type: BodyType.dynamic,
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Target) {
      removeFromParent();
    }
  }
}