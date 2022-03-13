import 'package:flutter/material.dart';
import 'package:lesson_average/constants.dart';

class AverageText extends StatelessWidget {
  final double average;
  final int lessonCount;

  const AverageText({Key? key,
  required this.average,
  required this.lessonCount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        lessonCount > 0 ? '$lessonCount Lesson added' : 'Insert Lessons',
        style: subtitleStyle,
      ),
      Text(average >= 0 ? '${average.toStringAsFixed(2)}' : '0,0', style: dominanttitleStyle,),
      Text("Total Average",style: subtitleStyle,)
    ],);
  }
}
