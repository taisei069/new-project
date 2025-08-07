import 'package:flame_forge2d/flame_forge2d.dart';

class Ground extends BodyComponent {
  final Vector2 size;

  Ground({required this.size});

  @override
  Body createBody() {
    final shape = EdgeShape()
      ..set(Vector2(0, size.y * 0.95), Vector2(size.x, size.y * 0.95));

    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef = BodyDef(position: Vector2.zero());

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}