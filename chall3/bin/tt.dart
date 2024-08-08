import 'dart:convert';

// Course class definition
class Course {
  final String courseName;
  final String courseCode;
  final List<String> schedule;

  Course({
    required this.courseName,
    required this.courseCode,
    required this.schedule,
  });

  // Factory constructor to create a Course from JSON data
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json['courseName'],
      courseCode: json['courseCode'],
      schedule: List<String>.from(json['schedule']),
    );
  }

  // Method to convert Course instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'courseName': courseName,
      'courseCode': courseCode,
      'schedule': schedule,
    };
  }
}

// University class definition
class University {
  final List<Course> _courses = [];

  // Method to add a new course
  void addCourse(Course course) {
    _courses.add(course);
    print('Course added: ${course.courseName}');
  }

  // Method to remove a course by its code
  void removeCourseByCode(String courseCode) {
    _courses.removeWhere((course) => course.courseCode == courseCode);
    print('Course removed with code: $courseCode');
  }

  // Method to list all courses with their schedules
  void listAllCourses() {
    if (_courses.isEmpty) {
      print('No courses available.');
      return;
    }
    for (var course in _courses) {
      print('Course Name: ${course.courseName}');
      print('Course Code: ${course.courseCode}');
      print('Schedule: ${course.schedule.join(", ")}\n');
    }
  }

  // Method to search for courses by name or code
  void searchCourses(String query) {
    var results = _courses.where((course) =>
        course.courseName.toLowerCase().contains(query.toLowerCase()) ||
        course.courseCode.toLowerCase().contains(query.toLowerCase()));

    if (results.isEmpty) {
      print('No courses found for query: $query');
    } else {
      for (var course in results) {
        print('Course Name: ${course.courseName}');
        print('Course Code: ${course.courseCode}');
        print('Schedule: ${course.schedule.join(", ")}\n');
      }
    }
  }

  // Method to parse a list of courses from JSON data
  void parseCoursesFromJson(String jsonData) {
    final parsedData = json.decode(jsonData) as List;
    _courses.clear();
    _courses.addAll(parsedData.map((json) => Course.fromJson(json)).toList());
  }

  // Method to convert all courses to JSON data
  String coursesToJson() {
    final coursesJson =
        _courses.map((course) => course.toJson()).toList();
    return json.encode(coursesJson);
  }
}

void main()
