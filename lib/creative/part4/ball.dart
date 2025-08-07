import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'target.dart';

class Ball extends BodyComponent {
  final Vector2 position;

  Ball({required this.position});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // ボールの見た目を描画
    add(
      CircleComponent(
        radius: 0.5,
        paint: Paint()..color = Colors.red,
        anchor: Anchor.center,
      ),
    );
  }

  @override
  Body createBody() {
    final shape = CircleShape()..radius = 0.5;
    final fixtureDef = FixtureDef(
      shape,
      restitution: 0.4, // 反発係数
      density: 1.0,     // 密度
      friction: 0.5,    // 摩擦
    );

    final bodyDef = BodyDef(
      userData: this,
      position: position,
      type: BodyType.dynamic, // 物理演算の影響を受ける
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  // 他のオブジェクトと衝突したときに呼ばれる
  @override
  void beginContact(Object other, Contact contact) {
    if (other is Target) {
      // ターゲットに当たったらボール自身を消す
      removeFromParent();
    }
  }
}