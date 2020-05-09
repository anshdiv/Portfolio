
import 'package:anshulportfolio/models/project_model.dart';

class ProjectResponse {
    List<ProjectModel> projects;

    ProjectResponse({this.projects});

    factory ProjectResponse.fromJson(Map<String, dynamic> json) {
        return ProjectResponse(
            projects: json['projects'] != null ? (json['projects'] as List).map((i) => ProjectModel.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.projects != null) {
            data['projects'] = this.projects.map((v) => v.toJson()).toList();
        }
        return data;
    }
}