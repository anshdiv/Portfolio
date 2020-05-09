import 'dart:convert';

import 'package:anshulportfolio/models/project_model.dart';
import 'package:anshulportfolio/models/project_response.dart';
import 'package:anshulportfolio/theme/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Projects extends StatefulWidget {
  Projects({Key key}) : super(key: key);

  @override
  _ProjectsState createState() {
    return _ProjectsState();
  }
}

class _ProjectsState extends State<Projects> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NeumorphicBackground(
        backendColor: Colors.white,
        margin: EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                top: 20,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text("PROJECTS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )))),
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.only(top: 60,bottom: 20),
                child: FutureBuilder(
                  future: getProjects(context),
                    builder: (BuildContext context, AsyncSnapshot<ProjectResponse> response){
                     if (response.hasData) {
                       return ListView.builder(
                           itemCount: response.data.projects.length,
                           itemBuilder: (context, index) {
                             return _projectWidget(response.data.projects[index]);
                           });
                     }else{
                       return Text("Loading");
                     }
                    }

                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _projectWidget(ProjectModel projectModel){
    return NeumorphicButton(
      margin: EdgeInsets.all(12),
      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      style: NeumorphicStyle(
        //border: NeumorphicBorder(
        //  isEnabled: true,
        //  width: 0.3,
        //),
        shape: NeumorphicShape.flat,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(child: Image.network(projectModel.thumbnail,height: 50,width: 50,),flex: 1),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(left:5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5,),
                Text(projectModel.name,style: TextStyle(fontSize: 16),),
                SizedBox(height: 5,),
                Text(projectModel.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12,color: Colors.grey)),
                SizedBox(height: 5,),

              ],
            ),
          ),flex: 4),
        ],
      ),
    );
  }


  Future<ProjectResponse> getProjects(BuildContext context) async {
    print("Data Loading");
    String data = await DefaultAssetBundle.of(context).loadString("assets/projects.json");
    print("Data Loaded");
    var jsonResult = json.decode(data);
    print(jsonResult);
    return ProjectResponse.fromJson(jsonResult);
  }
}