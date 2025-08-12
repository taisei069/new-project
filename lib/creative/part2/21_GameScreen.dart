// GameScreen.dart

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/quiz.dart';
import 'package:safety_go/creative/score_display.dart'; //ここにかいてる
import 'package:safety_go/correct_counter.dart';
import 'package:safety_go/l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GameScreen21 extends StatefulWidget {
  const GameScreen21({super.key});

  @override
  State<GameScreen21> createState() => _GameScreenState21();
}

class _GameScreenState21 extends State<GameScreen21>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _gameTimer;
  Timer? _countdownTimer;
  int _countdownTime = 3;
  bool _isCountingDown = true;
  bool _showInstructions = true;

  int _remainingTime = gameTotalTime;
  bool _isTimeUp = false;
  bool _isNavigating = false;

  static const double avatarMaxSize = 200.0;
  static const double avatarMinSize = 80.0;
  static const double targetSize = 100.0;
  static const int gameTotalTime = 8;
  static const int animationDurationSeconds = 8;
  //final String _correctAnswerId = 'A';
  static const int totalQuestions = 5;
  var questions = QuestionData_2.all;//コピペ注意

  @override
  void initState() {
    super.initState();
    questions;
    if (indexCounter_creative.count == 0) {
      CorrectCounter_creative_2.reset();
    }
    /*if (indexCounter_creative.indexCount == 4) {
      indexCounter_creative.reset();
    }*/
    _controller = AnimationController(
      duration: const Duration(seconds: animationDurationSeconds),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _startCountdown();
  }

  @override
  void dispose() {
    _gameTimer?.cancel();
    _countdownTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startGame() {
    _gameTimer?.cancel();
    setState(() {
      questions;
      _remainingTime = gameTotalTime;
      _isTimeUp = false;
      _isNavigating = false;
      _controller.forward(from: 0.0);
    });

    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _showInstructions = false;
        });
      }
    });

    _gameTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _navigateToResultScreen(false);
      }
    });
  }

  void _startCountdown() {
    _gameTimer?.cancel();
    _controller.reset();
    setState(() {
      _isCountingDown = true;
      _showInstructions = true;
      _isTimeUp = false;
      _countdownTime = 3;
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_countdownTime > 1) {
        setState(() {
          _countdownTime--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isCountingDown = false;
        });
        _startGame();
      }
    });
  }

  void _navigateToResultScreen(bool isCorrect) {
    if (_isNavigating) return;
    _gameTimer?.cancel();
    _controller.stop();
    setState(() {
      _isNavigating = true;
    });
    indexCounter_creative.increment();
    if (isCorrect) {
      CorrectCounter_creative_2.increment();
    }
    if (indexCounter_creative.count == totalQuestions) {
      _onQuizFinished();
    }
    Future.delayed(const Duration(milliseconds: 50), () {
      if (mounted) {
        context.go('/creative_21_1', extra: {'isCorrect': isCorrect, 'id': questions[indexCounter_creative.indexCount-1]['id']});
      }
    });
  }
  Future<void> _onQuizFinished() async {
    if (CorrectCounter_creative_2.correctCount == 5) {
      await _savePart1Flag();
    }
  }
Future<void> _savePart1Flag() async {
  try { // ▼▼▼ tryを追加 ▼▼▼
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = FirebaseFirestore.instance.collection('game_progress').doc(uid);

    await FirebaseFirestore.instance.runTransaction((tx) async {
      final snapshot = await tx.get(docRef);
      // 'part_1' や 'part_2' のように、保存するフラグ名が正しいか確認してください
      final current = (snapshot.data()?['part_3'] ?? 0) as int; // ← 保存するフラグ名を確認
      if (current >= 2) return;
      tx.set(docRef, {'part_3': 2}, SetOptions(merge: true)); // ← 保存するフラグ名を確認
    });

    print('達成フラグの保存に成功しました！'); // 成功した場合はログを表示

  } catch (e) { // ▼▼▼ catchを追加 ▼▼▼
    // もしエラーが発生したら、アプリを止めずに内容をコンソールに表示する
    print('エラー発生：フラグの保存に失敗しました。詳細: $e');
  }
}

  @override
Widget build(BuildContext context) {
  final t = AppLocalizations.of(context)!;
  final screenSize = MediaQuery.of(context).size;
  final roadTopY = screenSize.height * 0.4;
  final roadBottomY = screenSize.height;
  final roadTopWidth = screenSize.width * 0.3;
  final roadBottomWidth = screenSize.width * 0.9;

  final leftTargetPosition = Offset(
    (screenSize.width / 2) - (roadTopWidth / 2) - (targetSize * 0.5) + (targetSize / 2),
    roadTopY - (targetSize * 0.7) + (targetSize / 2),
  );
  final rightTargetPosition = Offset(
    (screenSize.width / 2) + (roadTopWidth / 2) - (targetSize * 0.5) + (targetSize / 2),
    roadTopY - (targetSize * 0.7) + (targetSize / 2),
  );

  return Scaffold(
    body: _isNavigating
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4CAF50), Color(0xFF81C784)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size.infinite,
                      painter: RoadPainter(
                        topY: roadTopY,
                        bottomY: roadBottomY,
                        topWidth: roadTopWidth,
                        bottomWidth: roadBottomWidth,
                      ),
                    ),
                    _buildTarget(
                      context: context,
                      targetId: 'A',
                      top: roadTopY - (targetSize * 0.7),
                      left: (screenSize.width / 2) -
                          (roadTopWidth / 2) -
                          targetSize ,
                    ),
                    _buildTarget(
                      context: context,
                      targetId: 'B',
                      top: roadTopY - (targetSize * 0.7),
                      left: (screenSize.width / 2) +
                          (roadTopWidth / 2) ,
                    ),
                    if (!_isTimeUp)
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          final progress = 1.0 - _animation.value;
                          final currentY =
                              roadTopY + (roadBottomY - roadTopY) * progress;
                          final currentScale = (avatarMinSize /
                                  avatarMaxSize) +
                              (1 - (avatarMinSize / avatarMaxSize)) *
                                  progress;
                          final roadCurrentWidth = roadTopWidth +
                              (roadBottomWidth - roadTopWidth) * progress;
                          final wobble =
                              sin(_animation.value * pi * 8) *
                                  (roadCurrentWidth * 0.1);
                          return Positioned(
                            top: currentY - (avatarMaxSize * currentScale),
                            left: (screenSize.width / 2) -
                                (avatarMaxSize * currentScale / 2) +
                                wobble,
                            child: Draggable<String>(
                              data: 'avatar',
                              onDragStarted: () {
                                _controller.stop();
                              },
                              onDragEnd: (details) {
                                if (!details.wasAccepted) {
                                  _controller.forward();
                                }
                              },
                              feedback: AvatarWidget(
                                size: avatarMaxSize * currentScale,
                                isDragging: true,
                                animationValue: _animation.value,
                              ),
                              childWhenDragging: Opacity(
                                opacity: (0.4).clamp(0.0, 1.0),
                                child: AvatarWidget(
                                  size: avatarMaxSize * currentScale,
                                  animationValue: _animation.value,
                                ),
                              ),
                              child: AvatarWidget(
                                size: avatarMaxSize * currentScale,
                                animationValue: _animation.value,
                              ),
                            ),
                          );
                        },
                      ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ProblemStatement(),
                    ),
                    // ★★★ ここからが修正箇所 ★★★
                    // TimerとScoreをRowで囲んで横並びにします
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 130.0),
                        padding: const EdgeInsets.symmetric(horizontal: 16.0), // 左右に余白を追加
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround, // ここで両端に配置
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // TimerDisplayを配置
                            TimerDisplay(
                              remainingTime: _remainingTime,
                              totalTime: gameTotalTime,
                            ),
                            // ScoreDisplayを配置
                            ScoreDisplay(
                              questionNumber: indexCounter_creative.count+1,
                              score: CorrectCounter_creative_2.correctCount,
                              totalQuestions: totalQuestions,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Positionedを使ったScoreDisplayは削除します
                    // ★★★ ここまでが修正箇所 ★★★
                  ],
                ),
              ),
              if (_showInstructions && !_isCountingDown && !_isTimeUp)
                IgnorePointer(
                  child: InstructionalOverlay(
                    avatarStartPosition: Offset(
                      screenSize.width / 2,
                      roadBottomY - avatarMaxSize / 2,
                    ),
                    leftTargetPosition: leftTargetPosition,
                    rightTargetPosition: rightTargetPosition,
                  ),
                ),
              if (_isCountingDown)
                Container(
                  color: Colors.black.withOpacity(0.7),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(
                            scale: animation, child: child);
                      },
                      child: Text(
                        '$_countdownTime',
                        key: ValueKey<int>(_countdownTime),
                        style: const TextStyle(
                          fontSize: 150,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              if (_isTimeUp)
                Container(
                  color: Colors.black.withOpacity(0.75),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('GAME OVER',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                letterSpacing: 4)),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: _startCountdown,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15)),
                          child: Text(t.tryag,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
  );
}
  Widget _buildTarget({
    required BuildContext context,
    required String targetId,
    required double top,
    required double left,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: DragTarget<String>(
        onAccept: (data) {
          if (!_isTimeUp) {
            final isCorrect = (targetId == questions[indexCounter_creative.indexCount]['correctAnswer']);
            _navigateToResultScreen(isCorrect);
          }
        },
        builder: (context, candidateData, rejectedData) {
          return TargetImageWidget(
            isHovered: candidateData.isNotEmpty,
            imagePath: targetId == questions[indexCounter_creative.indexCount]['correctAnswer']
                ? questions[indexCounter_creative.indexCount]['imagePath_1']
                : questions[indexCounter_creative.indexCount]['imagePath_2'],
          );
        },
      ),
    );
  }
}

class InstructionalOverlay extends StatefulWidget {
  final Offset avatarStartPosition;
  final Offset leftTargetPosition;
  final Offset rightTargetPosition;

  const InstructionalOverlay({
    super.key,
    required this.avatarStartPosition,
    required this.leftTargetPosition,
    required this.rightTargetPosition,
  });

  @override
  State<InstructionalOverlay> createState() => _InstructionalOverlayState();
}

class _InstructionalOverlayState extends State<InstructionalOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: ArrowPainter(
        animation: _animationController,
        startPoint: widget.avatarStartPosition,
        leftEndPoint: widget.leftTargetPosition,
        rightEndPoint: widget.rightTargetPosition,
      ),
    );
  }
}

class ArrowPainter extends CustomPainter {
  final Animation<double> animation;
  final Offset startPoint;
  final Offset leftEndPoint;
  final Offset rightEndPoint;

  ArrowPainter({
    required this.animation,
    required this.startPoint,
    required this.leftEndPoint,
    required this.rightEndPoint,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    _drawDashedArrow(canvas, startPoint, leftEndPoint, Colors.red[400]!);
    _drawDashedArrow(canvas, startPoint, rightEndPoint, Colors.blue[400]!);
  }

  void _drawDashedArrow(Canvas canvas, Offset start, Offset end, Color color) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final distance = (end - start).distance;
    const dashSize = 15.0;
    const gapSize = 10.0;
    final totalSegmentLength = dashSize + gapSize;
    
    final animProgress = animation.value;
    final visibleDistance = distance * animProgress;
    
    final path = Path();
    path.moveTo(start.dx, start.dy);
    
    double currentDistance = 0;
    while (currentDistance < visibleDistance) {
      final endDash = min(currentDistance + dashSize, visibleDistance);
      final p1 = Offset.lerp(start, end, currentDistance / distance)!;
      final p2 = Offset.lerp(start, end, endDash / distance)!;
      path.moveTo(p1.dx, p1.dy);
      path.lineTo(p2.dx, p2.dy);
      currentDistance += totalSegmentLength;
    }
    
    canvas.drawPath(path, paint);

    if (visibleDistance > 0) {
      final tipPoint = Offset.lerp(start, end, visibleDistance / distance)!;
      final angle = (end - start).direction;
      const arrowSize = 20.0;
      const arrowAngle = 0.5; // rad

      final arrowPath = Path()
        ..moveTo(tipPoint.dx - arrowSize * cos(angle - arrowAngle), tipPoint.dy - arrowSize * sin(angle - arrowAngle))
        ..lineTo(tipPoint.dx, tipPoint.dy)
        ..lineTo(tipPoint.dx - arrowSize * cos(angle + arrowAngle), tipPoint.dy - arrowSize * sin(angle + arrowAngle));
        
      canvas.drawPath(arrowPath, paint..style=PaintingStyle.stroke);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AvatarWidget extends StatelessWidget {
  final double size;
  final bool isDragging;
  final double animationValue;

  const AvatarWidget({
    super.key,
    required this.size,
    this.isDragging = false,
    required this.animationValue,
  });

  @override
  Widget build(BuildContext context) {
    final scaleX = (animationValue * 15).floor() % 2 == 0 ? 1.0 : -1.0;

    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..scale(scaleX, 1.0),
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(
          Icons.directions_run,
          color: isDragging ? Colors.yellow : Colors.black,
          size: size,
          shadows: const [
            Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2, 2))
          ],
        ),
      ),
    );
  }
}

class TargetImageWidget extends StatelessWidget {
  final bool isHovered;
  final String imagePath;
  const TargetImageWidget(
      {super.key, required this.isHovered, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // ★★★ ここからが修正箇所 ★★★
    return Container(
      width: _GameScreenState21.targetSize,
      height: _GameScreenState21.targetSize,
      decoration: BoxDecoration(
        color: Colors.white, // 背景色を白に設定
        borderRadius: BorderRadius.circular(10),
        boxShadow: isHovered
            ? [
                const BoxShadow(
                    color: Colors.yellow, blurRadius: 20, spreadRadius: 2)
              ]
            : [
              const BoxShadow(
                    color: Colors.black38, blurRadius: 5, offset: Offset(2, 2))
            ],
      ),
      child: ClipRRect( // Containerの角丸に合わせて画像を切り抜く
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0), // 画像の周りに余白を追加
          child: Opacity(
            opacity: isHovered ? 1.0 : 0.85,
            child: Image.asset(
              imagePath,
              // 表示方法を.containに変更し、画像全体が枠内に収まるようにする
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                    child: Text('画像', style: TextStyle(color: Colors.black)));
              },
            ),
          ),
        ),
      ),
    );
    // ★★★ ここまでが修正箇所 ★★★
  }
}

class RoadPainter extends CustomPainter {
  final double topY, bottomY, topWidth, bottomWidth;
  RoadPainter(
      {required this.topY,
      required this.bottomY,
      required this.topWidth,
      required this.bottomWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paintRoad = Paint()..color = Colors.grey[700]!;
    final paintLine = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.square;
    final roadPath = Path()
      ..moveTo(size.width / 2 - bottomWidth / 2, bottomY)
      ..lineTo(size.width / 2 - topWidth / 2, topY)
      ..lineTo(size.width / 2 + topWidth / 2, topY)
      ..lineTo(size.width / 2 + bottomWidth / 2, bottomY)
      ..close();
    canvas.drawPath(roadPath, paintRoad);
    const dashCount = 10;
    for (int i = 0; i < dashCount; i++) {
      final progress = i / dashCount;
      final nextProgress = (i + 0.5) / dashCount;
      final y1 = topY + (bottomY - topY) * (progress * progress);
      final y2 = topY + (bottomY - topY) * (nextProgress * nextProgress);
      if (y2 > bottomY) break;
      canvas.drawLine(
          Offset(size.width / 2, y1), Offset(size.width / 2, y2), paintLine);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TimerDisplay extends StatelessWidget {
  final int remainingTime;
  final int totalTime; // ★ totalTimeを引数に追加
  const TimerDisplay({super.key, required this.remainingTime, required this.totalTime});

  @override
  Widget build(BuildContext context) {
    final bool isUrgent = remainingTime <= 3;
    final Color displayColor = isUrgent ? Colors.red.shade400 : Colors.white;

    // ★★★ ここからが修正箇所 ★★★
    // 時間経過の割合（0.0 -> 1.0）を計算
    final progress = (totalTime - remainingTime) / totalTime;
    // progressに応じてスケールを計算（例: 1.0倍から1.5倍まで拡大）
    final double currentScale = 1.0 + (progress * 0.5);

    // 親のTweenAnimationBuilderをTransform.scaleに変更
    return Transform.scale(
      scale: currentScale,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: displayColor, width: 2),
          boxShadow: [
            BoxShadow(
                color: displayColor.withOpacity(0.8),
                blurRadius: isUrgent ? 15 : 0,
                spreadRadius: isUrgent ? 2 : 0)
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.timer_outlined, color: displayColor, size: 22),
            const SizedBox(width: 8),
            Text(
              remainingTime.toString().padLeft(2, '0'),
              style: TextStyle(
                  color: displayColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace'),
            ),
          ],
        ),
      ),
    );
    // ★★★ ここまでが修正箇所 ★★★
  }
}

class ProblemStatement extends StatelessWidget {
  const ProblemStatement({super.key});

  @override
  Widget build(BuildContext context) {
    var questions = QuestionData_2.all;//コピペ注意
    final t = AppLocalizations.of(context)!;
    final List<String> questionTexts = [//コピペ注意
      t.swipeh2_1q,
      t.swipeh2_2q,
      t.swipeh2_3q,
      t.swipeh2_4q,
      t.swipeh2_5q,
    ];
    // ★★★ ここからが修正箇所 ★★★
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(15.0),
      ),
      // AnimatedSwitcherを削除し、シンプルなTextウィジェットに変更
      child: Text(
        questionTexts[questions[indexCounter_creative.indexCount]['id']],//t.swipeh1_1q,
        style: const TextStyle( // フォントサイズを20.0に固定
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
    // ★★★ ここまでが修正箇所 ★★★
  }
}

extension on Timer {
  void pause() {
  }
  void resume() {
  }
}