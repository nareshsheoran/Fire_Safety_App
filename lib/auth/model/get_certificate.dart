class CertificateRequest {
  String name;
  String mobile;
  String password;

  CertificateRequest({
    this.name,
    this.mobile,
    this.password,
  });

  CertificateRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map();
    map['name'] = name;
    map['mobile'] = mobile;
    map['password'] = password;
    return map;
  }
}
