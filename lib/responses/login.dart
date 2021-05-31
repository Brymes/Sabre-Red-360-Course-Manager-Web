class LoginResponse {
  Data data;

  LoginResponse({this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  TokenAuth tokenAuth;

  Data({this.tokenAuth});

  Data.fromJson(Map<String, dynamic> json) {
    tokenAuth = json['tokenAuth'] != null ? new TokenAuth.fromJson(json['tokenAuth']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tokenAuth != null) {
      data['tokenAuth'] = this.tokenAuth.toJson();
    }
    return data;
  }
}

class TokenAuth {
  String token;
  Payload payload;
  String refreshToken;
  int refreshExpiresIn;

  TokenAuth({this.token, this.payload, this.refreshToken, this.refreshExpiresIn});

  TokenAuth.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    payload = json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    refreshToken = json['refreshToken'];
    refreshExpiresIn = json['refreshExpiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.payload != null) {
      data['payload'] = this.payload.toJson();
    }
    data['refreshToken'] = this.refreshToken;
    data['refreshExpiresIn'] = this.refreshExpiresIn;
    return data;
  }
}

class Payload {
  String email;
  int exp;
  int origIat;

  Payload({this.email, this.exp, this.origIat});

  Payload.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    exp = json['exp'];
    origIat = json['origIat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['exp'] = this.exp;
    data['origIat'] = this.origIat;
    return data;
  }
}
