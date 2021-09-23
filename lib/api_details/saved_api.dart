class Video_Model {
  String id;
  String name;
  String video;
  String date;

  Video_Model({this.id, this.name, this.video, this.date});

  Video_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    video = json['video'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['video'] = this.video;
    data['date'] = this.date;
    return data;
  }
}
