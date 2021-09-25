class CertificateRequest {
  String roll_no;
  String mobile;

  CertificateRequest({
    this.mobile,
    this.roll_no,
  });

  CertificateRequest.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    roll_no = json['roll_no'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map();
    map['roll_no'] = roll_no;
    map['mobile'] = mobile;
    return map;
  }
}
