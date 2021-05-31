class CourseRegResponse {
  Data data;

  CourseRegResponse({this.data});

  CourseRegResponse.fromJson(Map<String, dynamic> json) {
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
  BookCourse bookCourse;

  Data({this.bookCourse});

  Data.fromJson(Map<String, dynamic> json) {
    bookCourse = json['bookCourse'] != null ? new BookCourse.fromJson(json['bookCourse']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bookCourse != null) {
      data['bookCourse'] = this.bookCourse.toJson();
    }
    return data;
  }
}

class BookCourse {
  Booking booking;

  BookCourse({this.booking});

  BookCourse.fromJson(Map<String, dynamic> json) {
    booking = json['booking'] != null ? new Booking.fromJson(json['booking']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.booking != null) {
      data['booking'] = this.booking.toJson();
    }
    return data;
  }
}

class Booking {
  String dateEnrolled;
  String bookingId;

  Booking({this.dateEnrolled, this.bookingId});

  Booking.fromJson(Map<String, dynamic> json) {
    dateEnrolled = json['dateEnrolled'];
    bookingId = json['bookingId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateEnrolled'] = this.dateEnrolled;
    data['bookingId'] = this.bookingId;
    return data;
  }
}
