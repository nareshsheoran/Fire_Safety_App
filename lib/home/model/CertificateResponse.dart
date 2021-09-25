class CertificateResponse {
  String certificate_url;
  String certificate_date;

  CertificateResponse({this.certificate_url, this.certificate_date});

  CertificateResponse.fromJson(Map<String, dynamic> map) {
    certificate_url = map['certificate_url'];
    certificate_date = map['certificate_date'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map();
    map['certificate_url'] = certificate_url;
    map['certificate_date'] = certificate_date;
    return map;
  }
}
