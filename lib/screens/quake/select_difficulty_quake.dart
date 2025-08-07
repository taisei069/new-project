import 'package:flutter/material.dart';
import 'package:safety_go/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/constants/route_paths.dart';
import 'package:safety_go/screens/login/login/auth_service.dart';

class Diffculty_quake extends StatelessWidget {
  const Diffculty_quake({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF667EEA), Color(0xFF64B6FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      t.genreTitle,
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            blurRadius: 10,
                            offset: Offset(2, 2),
                          ),
                        ],
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),

                    _buildVibrantButton(
                      icon: Icons.quiz,
                      label: t.ox,
                      colors: const [Color(0xFF42A5F5), Color(0xFF478DE0)],
                      onPressed: () => context.go(RoutePaths.easy_quake),
                      maxWidth: screenWidth,
                    ),

                    const SizedBox(height: 32),

                    _buildVibrantButton(
                      icon: Icons.traffic,
                      label: t.disastersign,
                      colors: const [Color(0xFF81C784), Color(0xFF66BB6A)],
                      onPressed: () => context.go(RoutePaths.normal_quake),
                      maxWidth: screenWidth,
                    ),

                    const SizedBox(height: 32),

                    _buildVibrantButton(
                      icon: Icons.directions_run,
                      label: t.trolley,
                      colors: const [Color(0xFFF48FB1), Color(0xFFF06292)],
                      onPressed: () => context.go(RoutePaths.creative_quake),
                      maxWidth: screenWidth,
                    ),

                    const SizedBox(height: 32),
                     _buildVibrantButton(
                      icon: Icons.sports_baseball, // 例として野球ボールのアイコン
                      label: '投擲ゲーム', // ラベル（後で多言語対応も可能）
                      colors: const [Color(0xFFFFA726), Color(0xFFFF7043)], // オレンジ系の色
                      onPressed: () => context.go(RoutePaths.throwing_game), // app_routerで設定したパス
                      maxWidth: screenWidth,
                    ),

                    _buildVibrantButton(
                      icon: Icons.arrow_back,
                      label: t.logout,
                      colors: const [Color(0xFF9575CD), Color(0xFF7E57C2)],
                      onPressed: () {
                        AuthService().signOut();
                        context.go(RoutePaths.rogin);
                      },
                      maxWidth: screenWidth,
                    ),

                    const SizedBox(height: 70),
                    _buildVibrantButton(
                      icon: Icons.menu_book,
                      label: t.inyou,
                      colors: const [Color.fromARGB(255, 202, 205, 117), Color.fromARGB(255, 194, 190, 87)],
                      onPressed: () {
                        AuthService().signOut();
                        context.go(RoutePaths.reference);
                      },
                      maxWidth: screenWidth,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVibrantButton({
    required IconData icon,
    required String label,
    required List<Color> colors,
    required VoidCallback onPressed,
    required double maxWidth,
  }) {
    // num を double にキャストしてエラー回避
    final double buttonWidth = maxWidth.clamp(200.0, 400.0) as double;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(36),
      splashColor: Colors.white24,
      child: Container(
        width: buttonWidth,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.last.withOpacity(0.6),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: colors.first.withOpacity(0.4),
              blurRadius: 30,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.white, shadows: const [
              Shadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(1, 1),
              ),
            ]),
            const SizedBox(width: 20),
            Flexible(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    ),
                  ],
                  letterSpacing: 1.1,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
