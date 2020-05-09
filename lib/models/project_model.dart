class ProjectModel {

  String description;
  String github;
  List<String> images;
  String name;
  String playstore;
  String thumbnail;
  String platform;

  ProjectModel({this.description, this.github, this.images, this.name, this.playstore, this.thumbnail,this.platform});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      description: json['description'],
      github: json['github'],
      images: json['images'] != null ? new List<String>.from(json['images']) : null,
      name: json['name'],
      playstore: json['playstore'],
      thumbnail: json['thumbnail'],
      platform: json['platform'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['github'] = this.github;
    data['name'] = this.name;
    data['playstore'] = this.playstore;
    data['thumbnail'] = this.thumbnail;
    data['platform'] = this.platform;
    if (this.images != null) {
      data['images'] = this.images;
    }
    return data;
  }
}