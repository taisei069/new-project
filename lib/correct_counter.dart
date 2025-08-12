// correct_counter.dart
import 'dart:math';
import 'package:safety_go/l10n/app_localizations.dart';
// correct_counter.dart
class CorrectCounter_nomal_1 {
  static int correctCount = 0;

  static void increment() {
    correctCount++;
  }

  static int get count => correctCount;

  static void reset() {
    correctCount = 0;
  }
}

// correct_counter.dart
class CorrectCounter_nomal_2 {
  static int correctCount = 0;

  static void increment() {
    correctCount++;
  }

  static int get count => correctCount;

  static void reset() {
    correctCount = 0;
  }
}

// correct_counter.dart
class CorrectCounter_nomal_3 {
  static int correctCount = 0;

  static void increment() {
    correctCount++;
  }

  static int get count => correctCount;

  static void reset() {
    correctCount = 0;
  }
}

// correct_counter.dart
class CorrectCounter_creative_1 {
  static int correctCount = 0;

  static void increment() {
    correctCount++;
  }

  static int get count => correctCount;

  static void reset() {
    correctCount = 0;
  }
}

// correct_counter.dart
class CorrectCounter_creative_2  {
  static int correctCount = 0;

  static void increment() {
    correctCount++;
  }

  static int get count => correctCount;

  static void reset() {
    correctCount = 0;
  }
}

// correct_counter.dart
class CorrectCounter_creative_3  {
  static int correctCount = 0;

  static void increment() {
    correctCount++;
  }

  static int get count => correctCount;

  static void reset() {
    correctCount = 0;
  }
}

class indexCounter_creative {
  static int indexCount = 0;
  static void increment() {
    indexCount++;
  }

  static int get count => indexCount;

  static void reset() {
    indexCount = 0;
  }
}
class QuestionData {
  
  static final List<Map<String, dynamic>> _originalQuestions = [
    {
      'imagePath_1': 'assets/images/creative/白非常出口.png',
      'imagePath_2': 'assets/images/creative/緑非常出口.png',
      'correctAnswer': 'A',
      'id': 0,
    },
    {
      'imagePath_1': 'assets/images/creative/飲料水.png',
      'imagePath_2': 'assets/images/creative/生活用水.png',
      'correctAnswer': 'B',
      'id': 1,
    },
    {
      'imagePath_1': 'assets/images/creative/漢字地震.png',
      'imagePath_2': 'assets/images/creative/漢字津波.png',
      'correctAnswer': 'B',
      'id': 2,
    },
    {
      'imagePath_1': 'assets/images/creative/津波想定してから.png',
      'imagePath_2': 'assets/images/creative/津波見てから.png',
      'correctAnswer': 'A',
      'id': 3,
    },
    {
      'imagePath_1': 'assets/images/creative/避難場所.png',
      'imagePath_2': 'assets/images/creative/避難所.png',
      'correctAnswer': 'B',
      'id': 4,
    },
  ];

  static List<Map<String, dynamic>> _shuffledQuestions = [..._originalQuestions]..shuffle(Random());

  /// シャッフル済の全体取得
  static List<Map<String, dynamic>> get all => _shuffledQuestions;

  /// 個別取得（インデックス指定）
  static Map<String, dynamic> question(int x) => _shuffledQuestions[x];

  /// 🔄 シャッフルをリセット（再シャッフル）
  static void resetShuffle() {
    _shuffledQuestions = [..._originalQuestions]..shuffle(Random());
  }
}

class QuestionData_2 {
  
  static final List<Map<String, dynamic>> _originalQuestions = [
    {
      'imagePath_1': 'assets/images/creative/洪水.png',
      'imagePath_2': 'assets/images/creative/津波.png',
      'correctAnswer': 'B',
      'id': 0,
    },
    {
      'imagePath_1': 'assets/images/creative/傘2.png',
      'imagePath_2':  'assets/images/creative/傘1.png',
      'correctAnswer': 'B',
      'id': 1,
    },
    {
      'imagePath_1': 'assets/images/creative/1.png',
      'imagePath_2': 'assets/images/creative/2.png',
      'correctAnswer': 'B',
      'id': 2,
    },
    {
      'imagePath_1': 'assets/images/creative/電話番号.png',
      'imagePath_2': 'assets/images/creative/calendar.png',
      'correctAnswer': 'A',
      'id': 3,
    },
    {
      'imagePath_1': 'assets/images/creative/AED.png',
      'imagePath_2': 'assets/images/creative/symbol_2.png',
      'correctAnswer': 'A',
      'id': 4,
    },
  ];

  static List<Map<String, dynamic>> _shuffledQuestions = [..._originalQuestions]..shuffle(Random());

  /// シャッフル済の全体取得
  static List<Map<String, dynamic>> get all => _shuffledQuestions;

  /// 個別取得（インデックス指定）
  static Map<String, dynamic> question(int x) => _shuffledQuestions[x];

  /// 🔄 シャッフルをリセット（再シャッフル）
  static void resetShuffle() {
    _shuffledQuestions = [..._originalQuestions]..shuffle(Random());
  }
}

class QuestionData_3 {
  
  static final List<Map<String, dynamic>> _originalQuestions = [
    {
      'imagePath_1': 'assets/images/swip_pr3/土石流_クイズ.png',
      'imagePath_2': 'assets/images/swip_pr3/原付.png',
      'correctAnswer': 'A',
      'id': 0,
    },
    {
      'imagePath_1': 'assets/images/swip_pr3/走る人.png' ,
      'imagePath_2':  'assets/images/swip_pr3/煙.png',
      'correctAnswer': 'B',
      'id': 1,
    },
    {
      'imagePath_1': 'assets/images/swip_pr3/たて.png' ,
      'imagePath_2':  'assets/images/swip_pr3/横.png',
      'correctAnswer': 'B',
      'id': 2,
    },
    {
      'imagePath_1': 'assets/images/swip_pr3/緊急地震速報.png',
      'imagePath_2': 'assets/images/image9.png',
      'correctAnswer': 'A',
      'id': 3,
    },
    {
      'imagePath_1': 'assets/images/swip_pr3/10m.png',
      'imagePath_2': 'assets/images/swip_pr3/5m.png',
      'correctAnswer': 'B',
      'id': 4,
    },
  ];

  static List<Map<String, dynamic>> _shuffledQuestions = [..._originalQuestions]..shuffle(Random());

  /// シャッフル済の全体取得
  static List<Map<String, dynamic>> get all => _shuffledQuestions;

  /// 個別取得（インデックス指定）
  static Map<String, dynamic> question(int x) => _shuffledQuestions[x];

  /// 🔄 シャッフルをリセット（再シャッフル）
  static void resetShuffle() {
    _shuffledQuestions = [..._originalQuestions]..shuffle(Random());
  }
}