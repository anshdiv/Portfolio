import 'dart:convert';

import 'package:anshulportfolio/models/project_response.dart';
import 'package:flutter/widgets.dart';

class ProjectNotifier extends ChangeNotifier{


   Future<ProjectResponse> getProjects(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/projects.json");
    var jsonResult = json.decode(data);
    return ProjectResponse.fromJson(jsonResult);
  }
}