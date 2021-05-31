class CourseListResponse {
  Data data;

  CourseListResponse({this.data});

  CourseListResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<MyCourses> myCourses;

  Data({this.myCourses});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['myCourses'] != null) {
      myCourses = new List<MyCourses>();
      json['myCourses'].forEach((v) {
        myCourses.add(new MyCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myCourses != null) {
      data['myCourses'] = this.myCourses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyCourses {
  Course course;

  MyCourses({this.course});

  MyCourses.fromJson(Map<String, dynamic> json) {
    course = json['course'] != null ? new Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.course != null) {
      data['course'] = this.course.toJson();
    }
    return data;
  }
}

class Course {
  String courseTitle;
  String courseInfo;
  String courseTutor;
  String startDate;

  Course({this.courseTitle, this.courseInfo, this.courseTutor, this.startDate});

  Course.fromJson(Map<String, dynamic> json) {
    courseTitle = json['courseTitle'];
    courseInfo = json['courseInfo'];
    courseTutor = json['courseTutor'];
    startDate = json['startDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['courseTitle'] = this.courseTitle;
    data['courseInfo'] = this.courseInfo;
    data['courseTutor'] = this.courseTutor;
    data['startDate'] = this.startDate;
    return data;
  }
}
