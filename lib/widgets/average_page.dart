import 'package:flutter/material.dart';
import 'package:lesson_average/Model/lesson.dart';
import 'package:lesson_average/constants.dart';
import 'package:lesson_average/helper/data_helper.dart';
import 'package:lesson_average/widgets/average_text.dart';
import 'package:lesson_average/widgets/credit_point_droplist.dart';
import 'package:lesson_average/widgets/lesson_list.dart';
import 'package:lesson_average/widgets/letter_point_droplist.dart';

class AveragePage extends StatefulWidget {
  AveragePage({Key? key}) : super(key: key);

  @override
  State<AveragePage> createState() => _AveragePageState();
}

class _AveragePageState extends State<AveragePage> {
  var forKey = GlobalKey<FormState>();
  double selectedCreditVal = 1;
  double selectedLetterVal = 4;
  String lessonEntry = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,//Transparent color for App Bar
        title: Center(
            child: Text( mainTitle, style: titleStyle)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Form
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _formBuilder(),
              ),
              Expanded(
                  flex: 1,
                  child: AverageText(
                    lessonCount: DataHelper.addedLessons.length,
                    average: DataHelper.calculateAverage(),
                  )),
            ],
          ),
          //List
          Expanded(
            child: LessonList(
              onRemoved: (index) {
                DataHelper.addedLessons.removeAt(index);
                setState(() {});
                //print('item removed : $index'); //prints dropped item
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _formBuilder() {
    return Form(
        key: forKey,
        child: Column(
          children: [
            _buildTextFormField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                LetterPointDroplist(onSelectedLetterPoint: (letter) {
                  selectedLetterVal = letter;
                }),
                CreditPointDroplist(onSelectedCreditPoint: (credit) {
                  selectedCreditVal = credit;
                }),
                IconButton(
                  onPressed: _addLessonandCalculate,
                  icon: Icon(Icons.arrow_forward_ios),
                  color: secondColor,
                  iconSize: 30,
                )
              ],
            )
          ],
        ));
  }

  Widget _buildTextFormField() {
    return Padding(
      padding: leftPadding,
      child: TextFormField(
        onSaved: (entry) {
          setState(() {
            lessonEntry = entry!;
          });
        },
        validator: (val) {
          if (val!.length <= 0) {
            return 'write lesson name';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            hintText: 'Lesson Name',
            border: OutlineInputBorder(
                borderRadius: cBorderRadius, borderSide: BorderSide.none),
            filled: true,
            fillColor: primaryColor.withOpacity(0.2)),
      ),
    );
  }

  void _addLessonandCalculate() {
    if (forKey.currentState!.validate()) {
      forKey.currentState!.save(); // for save entries.
      var lessonItem =
          Lesson(lessonEntry, selectedLetterVal, selectedCreditVal);
      DataHelper.addLesson(lessonItem);
      print(DataHelper.calculateAverage()); //FIXME: remove for production
      setState(() {});
    }
  }
}
