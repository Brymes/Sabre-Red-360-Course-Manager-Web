import 'package:webapp/index.dart';

class CourseInfo {
  // FIXME Iterate over the list of Sabre Colors
  final String courseTitle, instructionLang;
  final int numOfStudents, studentPercentage;
  final Color color;
  final String svgSrc;

  CourseInfo(
      {this.svgSrc,
      this.courseTitle,
      this.instructionLang,
      this.studentPercentage,
      this.numOfStudents,
      this.color});
}

List demoCourseInfo = [
  CourseInfo(
      courseTitle: "Intro to Aviation",
      numOfStudents: 30,
      svgSrc: "assets/icons/Documents.svg",
      studentPercentage: 60,
      color: primaryColor,
      instructionLang: "English"),
  CourseInfo(
      courseTitle: "Intro to GDS",
      numOfStudents: 30,
      svgSrc: "assets/icons/Documents.svg",
      studentPercentage: 60,
      color: Color(0xFF31B98E),
      instructionLang: "French"),
];

/* 
  CourseInfo(
    title: "One Drive",
    numOfFiels: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "1GB",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CourseInfo(
    title: "Documents",
    numOfFiels: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
]; */
