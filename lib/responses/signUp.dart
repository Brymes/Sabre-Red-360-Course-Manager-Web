class CreateUserResponse {
  Data data;

  CreateUserResponse({this.data});

  CreateUserResponse.fromJson(Map<String, dynamic> json) {
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
  CreateUser createUser;

  Data({this.createUser});

  Data.fromJson(Map<String, dynamic> json) {
    createUser = json['createUser'] != null ? new CreateUser.fromJson(json['createUser']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.createUser != null) {
      data['createUser'] = this.createUser.toJson();
    }
    return data;
  }
}

class CreateUser {
  User user;

  CreateUser({this.user});

  CreateUser.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String userId;
  String firstName;
  String lastName;
  String role;

  User({this.userId, this.firstName, this.lastName, this.role});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['role'] = this.role;
    return data;
  }
}
