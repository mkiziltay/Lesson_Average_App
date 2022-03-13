import 'package:flutter/material.dart';
import 'package:lesson_average/Model/lesson.dart';
import 'package:lesson_average/constants.dart';
import 'package:lesson_average/helper/data_helper.dart';

class LessonList extends StatelessWidget {
  
  final Function onRemoved;

  const LessonList({required this.onRemoved, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Lesson> allLessons = DataHelper.addedLessons;
    return allLessons.length > 0 //if bigger than 0 do this. So if added any lesson.
        ? ListView.builder(
            itemCount: allLessons.length,
            itemBuilder: ((context, index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                key: UniqueKey(), //unique key for every list item
                onDismissed: (item) {
                  onRemoved(index);
                },
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Card(
                      child: ListTile(
                    title: Text(allLessons[index].name),
                    leading: CircleAvatar(
                        backgroundColor: secondColor,
                        child: Text((allLessons[index].letterPoint *
                                allLessons[index].creditPoint)
                            .toStringAsFixed(1))),
                    subtitle: Text(
                        '${allLessons[index].creditPoint} Credit, Point : ${allLessons[index].letterPoint}'),
                  )),
                ),
              );
            }))
        : Container( //else (if not bigger than 0) do this. So if no added lesson before.
            child: Text(
              '\t\tNo Added Lesson',
              style: titleStyle,
            ),
          );
  }
}
