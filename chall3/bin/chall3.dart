import 'package:chall3/chall3.dart' as chall3;
import 'data.dart';

void main() {
  var university = University();
  university.coursesFromJson(data);


  university.listAllCourses();

  print("------------------------ adding course ----------------------------------");
  var newCourse = Course(
      courseName: "Software Engineering",
      courseCode: "C01",
      schedule: ["Thursday 9"]);
  university.addCourse(newCourse);

  print("------------------------After adding course ----------------------------------");
  university.listAllCourses();

  print("------------------------Search for cours C01 ----------------------------------");
  university.searchCourses("C01");

  print("------------------------Removing cours CS401 ----------------------------------");
  university.removeCourseByCode("CS401");

}


class Course {
  final String courseName;
  final String courseCode;
  final List<String> schedule;

  Course({
    required this.courseName,
    required this.courseCode,
    required this.schedule,
  });


  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json['courseName'],
      courseCode: json['courseCode'],
      schedule: List<String>.from(json['schedule']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'courseName': courseName,
      'courseCode': courseCode,
      'schedule': schedule,
    };
  }
}


class University {
  final List<Course> courses = [];

  void addCourse(Course course) {
    courses.add(course);
    print("Course added");
  }

  void removeCourseByCode(String courseCode) {
    courses.removeWhere((course) => course.courseCode == courseCode);
    print("$courseCode is deleted");
  }

  void listAllCourses() {
    for (var course in courses) {
      print(course.courseName);
      print(course.courseCode);
      print(course.schedule);
    }
    print("\n");
  }

  void searchCourses(String index) {
    var results = courses.where((course) =>
        course.courseCode.toLowerCase().contains(index.toLowerCase()));
 
      for (var course in results) {
        print("-----> Result found <-----");
        print('Course Name: ${course.courseName}');
        print('Course Code: ${course.courseCode}');
        print('Schedule: ${course.schedule.join(", ")}\n');
      }
    
  }


  void coursesFromJson(Map<String, dynamic> jsonData) {
    final courseList = jsonData['courses'] as List;
    courses.addAll(courseList.map((json) => Course.fromJson(json)).toList());
  }

 
}
