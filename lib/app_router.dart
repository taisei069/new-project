//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_go/creative/part1/1_GameScreen.dart';
import 'package:safety_go/screens/language/select_language.dart';
import 'package:safety_go/screens/language/modify_language.dart';
import 'package:safety_go/screens/login/rogin.dart';
//import 'package:safety_go/screens/mainpage/select_detail.dart';
//import 'package:safety_go/screens/mainpage/select_genre.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_10.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_6.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_7.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_8.dart';
import 'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_9.dart';
import 'package:safety_go/screens/quake/select_difficulty_quake.dart';

import 'package:safety_go/screens/quake/easy_quake/easy_quake.dart';
import 'package:safety_go/screens/quake/easy_quake/st_study_easy_quake/st_study_easy_quake_1.dart';
import 'package:safety_go/screens/quake/easy_quake/st_study_easy_quake/st_study_easy_quake_2.dart';
import 'package:safety_go/screens/quake/easy_quake/st_study_easy_quake/st_study_easy_quake_3.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_1.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_2.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_3.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_4.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_5.dart';
import 'package:safety_go/screens/quake/easy_quake/st_problem_easy_quake/st_problem_easy_quake_6.dart';
import 'package:safety_go/screens/quake/normal_quake/normal_quake.dart';
import 'package:safety_go/screens/quake/normal_quake/st_study_normal_quake/st_study_normal_quake_1.dart';
import 'package:safety_go/screens/quake/normal_quake/st_study_normal_quake/st_study_normal_quake_2.dart';
import 'package:safety_go/screens/quake/normal_quake/st_study_normal_quake/st_study_normal_quake_3.dart';

import 'package:safety_go/screens/scenario/sce_home.dart';
import 'package:safety_go/screens/scenario/sce_1_1.dart';
import 'package:safety_go/screens/scenario/sce_1_2.dart';
import 'package:safety_go/screens/scenario/sce_1_3.dart';
import 'package:safety_go/screens/scenario/sce_1_4.dart';
import 'package:safety_go/screens/scenario/sce_1_5.dart';
import 'package:safety_go/screens/scenario/sce_1_6.dart';
import 'package:safety_go/screens/scenario/sce_1_7.dart';
import 'package:safety_go/screens/scenario/sce_1_8.dart';
import 'package:safety_go/screens/scenario/sce_1_9.dart';
import 'package:safety_go/screens/scenario/sce_1_10.dart';
import 'package:safety_go/screens/scenario/sce_1sub1.dart';
import 'package:safety_go/screens/scenario/sce_1sub2.dart';
import 'package:safety_go/screens/scenario/sce_1sub3.dart';
import 'package:safety_go/screens/scenario/sce_1sub4.dart';
import 'package:safety_go/screens/scenario/sce_1sub5.dart';
import 'package:safety_go/screens/scenario/sce_1sub6.dart';
import 'package:safety_go/screens/scenario/sce_1sub7.dart';
import 'package:safety_go/screens/scenario/sce_1sub8.dart';
import 'package:safety_go/screens/scenario/sce_1sub9.dart';
import 'package:safety_go/screens/scenario/sce_1sub10.dart';
import 'package:safety_go/screens/scenario/sce_1sub11.dart';
import 'package:safety_go/screens/scenario/sce_1sub12.dart';
import 'package:safety_go/screens/scenario/sce_1sub13.dart';
import 'package:safety_go/screens/scenario/sce_1_ans.dart';


import 'package:safety_go/screens/scenario/sce_2_1.dart';
import 'package:safety_go/screens/scenario/sce_2_2.dart';
import 'package:safety_go/screens/scenario/sce_2_3.dart';
import 'package:safety_go/screens/scenario/sce_2_4.dart';
import 'package:safety_go/screens/scenario/sce_2_5.dart';
import 'package:safety_go/screens/scenario/sce_2_6.dart';
import 'package:safety_go/screens/scenario/sce_2_7.dart';
import 'package:safety_go/screens/scenario/sce_2_8.dart';
import 'package:safety_go/screens/scenario/sce_2_9.dart';
import 'package:safety_go/screens/scenario/sce_2_10.dart';
import 'package:safety_go/screens/scenario/sce_3_1.dart';
import 'package:safety_go/screens/scenario/sce_3_2.dart';
import 'package:safety_go/screens/scenario/sce_3_3.dart';
import 'package:safety_go/screens/scenario/sce_3_4.dart';
import 'package:safety_go/screens/scenario/sce_3_5.dart';
import 'package:safety_go/screens/scenario/sce_3_6.dart';
import 'package:safety_go/screens/scenario/sce_3_7.dart';
import 'package:safety_go/screens/scenario/sce_3_8.dart';
import 'package:safety_go/screens/scenario/sce_3_9.dart';
import 'package:safety_go/screens/scenario/sce_3_10.dart';
import 'package:safety_go/screens/scenario/sce_3_11.dart';

import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_1.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_2.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_3.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_4.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_5.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_11.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_12.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_13.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_14.dart';
import'package:safety_go/screens/quake/normal_quake/st_problem_normal_quake/st_problem_normal_quake_15.dart';

import'package:safety_go/screens/login/login/auth_gate.dart';

import 'package:safety_go/creative/part1/1_GameScreen.dart';
import 'package:safety_go/creative/part1/1_ResultScreen.dart';
import 'package:safety_go/creative/part1/2_GameScreen.dart';
import 'package:safety_go/creative/part1/2_ResultScreen.dart';
import 'package:safety_go/creative/part1/3_GameScreen.dart';
import 'package:safety_go/creative/part1/3_ResultScreen.dart';
import 'package:safety_go/creative/part1/4_GameScreen.dart';
import 'package:safety_go/creative/part1/4_ResultScreen.dart';
import 'package:safety_go/creative/part1/5_GameScreen.dart';
import 'package:safety_go/creative/part1/5_ResultScreen.dart';
import 'package:safety_go/creative/creative_quake.dart';

import 'package:safety_go/creative/part2/21_GameScreen.dart';
import 'package:safety_go/creative/part2/21_ResultScreen.dart';
import 'package:safety_go/creative/part2/22_GameScreen.dart';
import 'package:safety_go/creative/part2/22_ResultScreen.dart';
import 'package:safety_go/creative/part2/23_GameScreen.dart';
import 'package:safety_go/creative/part2/23_ResultScreen.dart';
import 'package:safety_go/creative/part2/24_GameScreen.dart';
import 'package:safety_go/creative/part2/24_ResultScreen.dart';
import 'package:safety_go/creative/part2/25_GameScreen.dart';
import 'package:safety_go/creative/part2/25_ResultScreen.dart';


import 'package:safety_go/creative/part3/31_GameScreen.dart';
import 'package:safety_go/creative/part3/31_ResultScreen.dart';
import 'package:safety_go/creative/part3/32_GameScreen.dart';
import 'package:safety_go/creative/part3/32_ResultScreen.dart';
import 'package:safety_go/creative/part3/33_GameScreen.dart';
import 'package:safety_go/creative/part3/33_ResultScreen.dart';
import 'package:safety_go/creative/part3/34_GameScreen.dart';
import 'package:safety_go/creative/part3/34_ResultScreen.dart';
import 'package:safety_go/creative/part3/35_GameScreen.dart';
import 'package:safety_go/creative/part3/35_ResultScreen.dart';

import 'package:safety_go/creative/part4/ball.dart';
import 'package:safety_go/creative/part4/ground.dart';
import 'package:safety_go/creative/part4/target.dart';
import 'package:safety_go/creative/part4/throwing_game.dart';
import 'package:safety_go/creative/part4/game_page.dart';

import 'package:safety_go/creative/part1/first.dart';

import 'package:safety_go/screens/quake/reference.dart';


GoRouter appRouter({
  required Locale locale,
  required void Function(Locale) onLocaleChanged,
}) {
  return GoRouter(
    initialLocation: '/language',//最初の画面なので，GoRoteのpathで変更可能

    routes: [
    //language
    GoRoute(path: '/language', builder: (context, state) => Select_language( onLanguageSelected: onLocaleChanged)),
    GoRoute(path: '/mode_language', builder: (context, state) => Mode_language()),

    //rogin
    GoRoute(path: '/rogin', builder: (context, state) => Rogin()),

    //mainscrean
    //GoRoute(path: '/genre', builder: (context, state) => Genre()),
    //GoRoute(path: '/detail', builder: (context, state) => Detail()),
    GoRoute(path: '/diffculty_quake', builder: (context, state) => Diffculty_quake()),

    //quake_easy
    GoRoute(path: '/easy_quake', builder: (context, state) => Easy_quake()),
    GoRoute(path: '/st_easy_quake1', builder: (context, state) => St_easy_quake1()),
    GoRoute(path: '/st_easy_quake2', builder: (context, state) => St_easy_quake2()),
    GoRoute(path: '/st_easy_quake3', builder: (context, state) => St_easy_quake3()),
    GoRoute(path: '/st_pro_easy_quake1', builder: (context, state) => St_pro_easy_quake1()),
    GoRoute(path: '/st_pro_easy_quake2', builder: (context, state) => St_pro_easy_quake2()),
    GoRoute(path: '/st_pro_easy_quake3', builder: (context, state) => St_pro_easy_quake3()),
    GoRoute(path: '/st_pro_easy_quake4', builder: (context, state) => St_pro_easy_quake4()),
    GoRoute(path: '/st_pro_easy_quake5', builder: (context, state) => St_pro_easy_quake5()),
    GoRoute(path: '/st_pro_easy_quake6', builder: (context, state) => St_pro_easy_quake6()),

    //quake_normal
    GoRoute(path: '/normal_quake', builder: (context, state) => Normal_quake()),
    GoRoute(path: '/st_normal_quake1', builder: (context, state) => St_normal_quake1()),
    GoRoute(path: '/st_normal_quake2', builder: (context, state) => St_normal_quake2()),
    GoRoute(path: '/st_normal_quake3', builder: (context, state) => St_normal_quake3()),
    GoRoute(path: '/st_pro_normal_quake1', builder: (context, state) => St_problem_normal_quake1()),
    GoRoute(path: '/st_pro_normal_quake2', builder: (context, state) => St_problem_normal_quake2()),
    GoRoute(path: '/st_pro_normal_quake3', builder: (context, state) => St_problem_normal_quake3()),
    GoRoute(path: '/st_pro_normal_quake4', builder: (context, state) => St_problem_normal_quake4()),
    GoRoute(path: '/st_pro_normal_quake5', builder: (context, state) => St_problem_normal_quake5()),
    GoRoute(path: '/st_pro_normal_quake6', builder: (context, state) => St_problem_normal_quake6()),
    GoRoute(path: '/st_pro_normal_quake7', builder: (context, state) => St_problem_normal_quake7()),
    GoRoute(path: '/st_pro_normal_quake8', builder: (context, state) => St_problem_normal_quake8()),
    GoRoute(path: '/st_pro_normal_quake9', builder: (context, state) => St_problem_normal_quake9()),
    GoRoute(path: '/st_pro_normal_quake10', builder: (context, state) => St_problem_normal_quake10()),
    GoRoute(path: '/st_pro_normal_quake11', builder: (context, state) => St_problem_normal_quake11()),
    GoRoute(path: '/st_pro_normal_quake12', builder: (context, state) => St_problem_normal_quake12()),
    GoRoute(path: '/st_pro_normal_quake13', builder: (context, state) => St_problem_normal_quake13()),
    GoRoute(path: '/st_pro_normal_quake14', builder: (context, state) => St_problem_normal_quake14()),
    GoRoute(path: '/st_pro_normal_quake15', builder: (context, state) => St_problem_normal_quake15()),

    //scenario
    GoRoute(path: '/scehome', builder: (context, state) => SceHome()),
    GoRoute(path: '/sce1_1', builder: (context, state) => Sce1_1()),
    GoRoute(path: '/sce1_2', builder: (context, state) => Sce1_2()),
    GoRoute(path: '/sce1_3', builder: (context, state) => Sce1_3()),
    GoRoute(path: '/sce1_4', builder: (context, state) => Sce1_4()),
    GoRoute(path: '/sce1_5', builder: (context, state) => Sce1_5()),
    GoRoute(path: '/sce1_6', builder: (context, state) => Sce1_6()),
    GoRoute(path: '/sce1_7', builder: (context, state) => Sce1_7()),
    GoRoute(path: '/sce1_8', builder: (context, state) => Sce1_8()),
    GoRoute(path: '/sce1_9', builder: (context, state) => Sce1_9()),
    GoRoute(path: '/sce1_10', builder: (context, state) => Sce1_10()),
    GoRoute(path: '/sce1s1', builder: (context, state) => Sce1s1()),
    GoRoute(path: '/sce1s2', builder: (context, state) => Sce1s2()),
    GoRoute(path: '/sce1s3', builder: (context, state) => Sce1s3()),
    GoRoute(path: '/sce1s4', builder: (context, state) => Sce1s4()),
    GoRoute(path: '/sce1s5', builder: (context, state) => Sce1s5()),
    GoRoute(path: '/sce1s6', builder: (context, state) => Sce1s6()),
    GoRoute(path: '/sce1s7', builder: (context, state) => Sce1s7()),
    GoRoute(path: '/sce1s8', builder: (context, state) => Sce1s8()),
    GoRoute(path: '/sce1s9', builder: (context, state) => Sce1s9()),
    GoRoute(path: '/sce1s10', builder: (context, state) => Sce1s10()),
    GoRoute(path: '/sce1s11', builder: (context, state) => Sce1s11()),
    GoRoute(path: '/sce1s12', builder: (context, state) => Sce1s12()),
    GoRoute(path: '/sce1s13', builder: (context, state) => Sce1s13()),
    GoRoute(path: '/sce1_ans', builder: (context, state) => Sce1_ans()),


    GoRoute(path: '/sce_2_1', builder: (context, state) => Sce_2_1()),
    GoRoute(path: '/sce_2_2', builder: (context, state) => Sce_2_2()),
    GoRoute(path: '/sce_2_3', builder: (context, state) => Sce_2_3()),
    GoRoute(path: '/sce_2_4', builder: (context, state) => Sce_2_4()),
    GoRoute(path: '/sce_2_5', builder: (context, state) => Sce_2_5()),
    GoRoute(path: '/sce_2_6', builder: (context, state) => Sce_2_6()),
    GoRoute(path: '/sce_2_7', builder: (context, state) => Sce_2_7()),
    GoRoute(path: '/sce_2_8', builder: (context, state) => Sce_2_8()),
    GoRoute(path: '/sce_2_9', builder: (context, state) => Sce_2_9()),
    GoRoute(path: '/sce_2_10', builder: (context, state) => Sce_2_10()),
    GoRoute(path: '/sce_3_1', builder: (context, state) => Sce_3_1()),
    GoRoute(path: '/sce_3_2', builder: (context, state) => Sce_3_2()),
    GoRoute(path: '/sce_3_3', builder: (context, state) => Sce_3_3()),
    GoRoute(path: '/sce_3_4', builder: (context, state) => Sce_3_4()),
    GoRoute(path: '/sce_3_5', builder: (context, state) => Sce_3_5()),
    GoRoute(path: '/sce_3_6', builder: (context, state) => Sce_3_6()),
    GoRoute(path: '/sce_3_7', builder: (context, state) => Sce_3_7()),
    GoRoute(path: '/sce_3_8', builder: (context, state) => Sce_3_8()),
    GoRoute(path: '/sce_3_9', builder: (context, state) => Sce_3_9()),
    GoRoute(path: '/sce_3_10', builder: (context, state) => Sce_3_10()),
    GoRoute(path: '/sce_3_10', builder: (context, state) => Sce_3_11()),


    //ログイン画面
    GoRoute(path: '/rogin_1',builder: (context, state) => const AuthGate(),),

    //creative問題
    //part1
    GoRoute(path: '/creative_quake', builder: (context, state) => Creative_quake()),
    GoRoute(path: '/creative_1', builder: (context, state) => GameScreen1()),
    GoRoute(path: '/creative_1_1',builder: (context, state) {
    final extra = state.extra as Map<String, dynamic>? ?? {};
    final isCorrect = extra['isCorrect'] as bool? ?? false;
    final id = extra['id'] as int? ?? -1; // idがnullだったときは -1 を仮で使う
    return ResultScreen1(isCorrect: isCorrect, id: id);
  },
),
    GoRoute(path: '/creative_2', builder: (context, state) => GameScreen2()),
    GoRoute(path: '/creative_2_1',builder: (context, state) {
    final isCorrect = state.extra as bool? ?? false;
    return ResultScreen2(isCorrect: isCorrect);},), 
    GoRoute(path: '/creative_3', builder: (context, state) => GameScreen3()),
    GoRoute(path: '/creative_3_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen3(isCorrect: isCorrect);
  },), 
    GoRoute(path: '/creative_4', builder: (context, state) => GameScreen4()),
    GoRoute(path: '/creative_4_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen4(isCorrect: isCorrect);
  },), 
   GoRoute(path: '/creative_5', builder: (context, state) => GameScreen5()),
    GoRoute(path: '/creative_5_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen5(isCorrect: isCorrect);
  },), 


  //part2
    // ★★★ 修正箇所: 重複していた '/creative_quake' の定義を削除 ★★★
    GoRoute(path: '/creative_21', builder: (context, state) => GameScreen21()),
    GoRoute(path: '/creative_21_1',builder: (context, state) {
    final isCorrect = state.extra as bool? ?? false;
    return ResultScreen21(isCorrect: isCorrect);},),
    GoRoute(path: '/creative_22', builder: (context, state) => GameScreen22()),
    GoRoute(path: '/creative_22_1',builder: (context, state) {
    final isCorrect = state.extra as bool? ?? false;
    return ResultScreen22(isCorrect: isCorrect);},), 
    GoRoute(path: '/creative_23', builder: (context, state) => GameScreen23()),
    GoRoute(path: '/creative_23_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen23(isCorrect: isCorrect);
  },), 
    GoRoute(path: '/creative_24', builder: (context, state) => GameScreen24()),
    GoRoute(path: '/creative_24_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen24(isCorrect: isCorrect);
  },), 
   GoRoute(path: '/creative_25', builder: (context, state) => GameScreen25()),
    GoRoute(path: '/creative_25_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen25(isCorrect: isCorrect);},),

    
    //part3
    // ★★★ 修正箇所: 重複していた '/creative_quake' の定義を削除 ★★★
    GoRoute(path: '/creative_31', builder: (context, state) => GameScreen31()),
    GoRoute(path: '/creative_31_1',builder: (context, state) {
    final isCorrect = state.extra as bool? ?? false;
    return ResultScreen31(isCorrect: isCorrect);},),
    GoRoute(path: '/creative_32', builder: (context, state) => GameScreen32()),
    GoRoute(path: '/creative_32_1',builder: (context, state) {
    final isCorrect = state.extra as bool? ?? false;
    return ResultScreen32(isCorrect: isCorrect);},), 
    GoRoute(path: '/creative_33', builder: (context, state) => GameScreen33()),
    GoRoute(path: '/creative_33_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen33(isCorrect: isCorrect);
  },), 
    GoRoute(path: '/creative_34', builder: (context, state) => GameScreen34()),
    GoRoute(path: '/creative_34_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen34(isCorrect: isCorrect);
  },), 
   GoRoute(path: '/creative_35', builder: (context, state) => GameScreen35()),
    GoRoute(path: '/creative_35_1',builder: (context, state) {
      final isCorrect = state.extra as bool? ?? false;
    return ResultScreen35(isCorrect: isCorrect);
  },), 
  GoRoute(path: '/First', builder: (context, state) => First()),


  GoRoute(path: '/throwing_game', builder: (context, state) => const GamePage()),
  
    
    ]
  );
}