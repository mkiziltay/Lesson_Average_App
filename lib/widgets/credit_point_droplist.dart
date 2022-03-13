import 'package:flutter/material.dart';
import 'package:lesson_average/constants.dart';
import 'package:lesson_average/helper/data_helper.dart';

class CreditPointDroplist extends StatefulWidget {
  final Function onSelectedCreditPoint;

  const CreditPointDroplist({required this.onSelectedCreditPoint, Key? key})
      : super(key: key);

  @override
  State<CreditPointDroplist> createState() => _CreditPointDroplistState();
}

class _CreditPointDroplistState extends State<CreditPointDroplist> {
  double selectedCreditVal = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: dropListPadding,
      decoration: BoxDecoration(
          color: transparentColor, //color of dropDown backg.
          borderRadius: cBorderRadius),
      child: DropdownButton<double>(
          underline: SizedBox(),
          value: selectedCreditVal,
          iconEnabledColor: secondColor.shade200,
          onChanged: (val) {
            setState(() {
              selectedCreditVal = val!;
              //print(val); //print selected value
              widget.onSelectedCreditPoint(selectedCreditVal);
            });
          },
          items: DataHelper.buildCreditList()),
    );
  }
}
