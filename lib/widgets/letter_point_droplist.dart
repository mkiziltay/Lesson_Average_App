import 'package:flutter/material.dart';
import 'package:lesson_average/helper/data_helper.dart';
import '../constants.dart';

class LetterPointDroplist extends StatefulWidget {
  final Function onSelectedLetterPoint;

  const LetterPointDroplist({Key? key, required this.onSelectedLetterPoint})
      : super(key: key);

  @override
  State<LetterPointDroplist> createState() => _LetterPointDroplistState();
}

class _LetterPointDroplistState extends State<LetterPointDroplist> {
  double selectedLetterVal = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: dropListPadding,
      decoration: BoxDecoration(
          color: transparentColor, //color of dropDown backg.
          borderRadius: cBorderRadius),
      child: DropdownButton<double>(
          underline: SizedBox(),
          value: selectedLetterVal,
          iconEnabledColor: secondColor.shade200,
          onChanged: (val) {
            setState(() {
              selectedLetterVal = val!;
              //print(val); //print selected value
              widget.onSelectedLetterPoint(selectedLetterVal);
            });
          },
          items: DataHelper.buildLetterList()),
    );
  }
}
