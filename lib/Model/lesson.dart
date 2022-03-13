class Lesson {
  final String name;
  final double letterPoint;
  final double creditPoint;

  Lesson(this.name, this.letterPoint, this.creditPoint);

  @override
  String toString() {
    // TODO: implement toString
    return '$name $letterPoint $creditPoint';
  }
}
