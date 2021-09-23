class BuyCoursesModel {
  String id;
  String courseName;
  String studyMaterial;
  String duration;
  String date;

  BuyCoursesModel(
      {this.id, this.courseName, this.studyMaterial, this.duration, this.date});

  BuyCoursesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['course_name'];
    studyMaterial = json['study_material'];
    duration = json['duration'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_name'] = this.courseName;
    data['study_material'] = this.studyMaterial;
    data['duration'] = this.duration;
    data['date'] = this.date;
    return data;
  }
}
