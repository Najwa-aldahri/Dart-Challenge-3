
### 💡 Challenge 3: University Course Scheduler with JSON Data 📅
**Here is a sample JSON data structure for the university courses:**
```

{
  "courses": [
    {
      "courseName": "Introduction to Programming",
      "courseCode": "CS101",
      "schedule": ["Monday 9:00 AM - 11:00 AM", "Wednesday 9:00 AM - 11:00 AM"]
    },
    {
      "courseName": "Data Structures",
      "courseCode": "CS102",
      "schedule": ["Tuesday 2:00 PM - 4:00 PM", "Thursday 2:00 PM - 4:00 PM"]
    },
    {
      "courseName": "Algorithms",
      "courseCode": "CS201",
      "schedule": ["Monday 1:00 PM - 3:00 PM", "Wednesday 1:00 PM - 3:00 PM"]
    },
    {
      "courseName": "Database Systems",
      "courseCode": "CS301",
      "schedule": ["Friday 10:00 AM - 12:00 PM"]
    }
  ]
}
```
**Challenge Requirements**

1. Create Dart Models
2. Define Dart classes to model the JSON data:
    - A `Course` class with properties for `courseName` (String), `courseCode` (String), and `schedule` (List of Strings).
    - A `University` class that manages a list of `Course` instances and includes methods to:
        - Add a new course.
        - Remove a course by code.
        - List all courses and their schedules.
        - Search for courses by name or code.
3. JSON Parsing
4. Implement functions to Parse the JSON data into Dart objects.
5. Implement the following methods in the `University` class:
    - `addCourse(Course course)`: Adds a new course to the list.
    - `removeCourseByCode(String courseCode)`: Removes a course by its code.
    - `listAllCourses()`: Lists all courses with their schedules.
    - `searchCourses(String query)`: Searches for courses by name or code.
  
---
**Dive in, have fun, and happy coding! 😎**
