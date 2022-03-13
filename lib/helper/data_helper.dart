import 'package:flutter/material.dart';
import 'package:lesson_average/Model/lesson.dart';

class DataHelper {
  // letter points
  static List<String> _lessonLetterPoints() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

// letters to points
  static double _letterToPoint(String letter) {
    switch (letter) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0.0;
      default:
        return 0;
    }
  }

//points of letters and bilding dropDown Menu items.
  static List<DropdownMenuItem<double>> buildLetterList() {
    return _lessonLetterPoints()
        .map((item) => DropdownMenuItem(
              child: Text(item),
              value: _letterToPoint(item),
            ))
        .toList();
  }

  //generating all Credits
  static List<int> _allCredits() {
    return List.generate(10, (index) => index + 1).toList();
  }

  //credits to dropList
  static List<DropdownMenuItem<double>> buildCreditList() {
    return _allCredits()
        .map((item) => DropdownMenuItem(
              child: Text(item.toString()),
              value: item.toDouble(),
            ))
        .toList();
  }

  //added lesson list
  static List<Lesson> addedLessons = [];

  //add lesson method
  static addLesson(Lesson lesson) {
    addedLessons.add(lesson);
  }

  // calculate average
  static double calculateAverage() {
    double totalPoint = 0;
    double totalCredit = 0;

    addedLessons.forEach((element) {
      totalPoint = totalPoint + (element.creditPoint * element.letterPoint);
      totalCredit += element.creditPoint;
    });

    return totalPoint / totalCredit;
  }
}
