import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF03fcf4);

const secondColor = Colors.indigo;

const transparentColor = Colors.transparent;

const mainTitle = "Average Calculation";

final TextStyle titleStyle = GoogleFonts.oswald(
    fontSize: 24, color: secondColor, fontWeight: FontWeight.w900);

final TextStyle subtitleStyle = GoogleFonts.oswald(
    fontSize: 16, color: secondColor, fontWeight: FontWeight.w600);

final TextStyle dominanttitleStyle = GoogleFonts.oswald(
    fontSize: 45, color: secondColor, fontWeight: FontWeight.w800);

final cBorderRadius = BorderRadius.circular(24);

const dropListPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

const leftPadding = EdgeInsets.only(left: 8);
/* Not required class for canstants. it's a choice.
class Constants {
  static const colorPrimary = Color.fromARGB(255, 2, 163, 212);
  
}
*/