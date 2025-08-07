import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'ball.dart';

class Target extends BodyComponent {
  final Vector2 position;

  Target({required this.position});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(
      RectangleComponent(
        size: Vector2(2, 2),
        paint: Paint()..color = Colors.blue,
        anchor: Anchor.center,
      ),
    );
  }

  @override
  Body createBody() {
    final shape = PolygonShape()..setAsBoxXY(1, 1);
    final fixtureDef = FixtureDef(shape, isSensor: true); // isSensor: trueで物理的な衝突はせず、接触イベントのみ発生
    final bodyDef = BodyDef(
      userData: this,
      position: position,
      type: BodyType.static, // 物理演算で動かない
    );
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Ball) {
      // ボールが当たったら消える
      removeFromParent();
    }
  }
}