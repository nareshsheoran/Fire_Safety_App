class SignUpRequest {
  String name;
  String mobile;
  String password;
  String otp;

  SignUpRequest({this.name, this.mobile, this.password, this.otp});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    password = json['password'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map();
    map['name'] = name;
    map['mobile'] = mobile;
    map['password'] = password;
    map['otp'] = otp;
    return map;
  }
}
