class LoginRequest {
  String mobile;
  String password;

  LoginRequest({this.mobile, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map();
    map['mobile'] = mobile;
    map['password'] = password;
    return map;
  }
}
