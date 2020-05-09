import 'package:anshulportfolio/models/skills_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Skills extends StatefulWidget {

  Skills({Key key}) : super(key: key);

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
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
                    child: Text("SKILLS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )))),
            Positioned.fill(
              child: Container(
                padding: EdgeInsets.only(top: 60, right: 10, left: 10,bottom: 20),
                child: ListView.builder(
                    itemCount: SkillsModel.getSkills().length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: EdgeInsets.only(bottom: 20,left: 10,right: 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    SkillsModel.getSkills()[index].skill,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                NeumorphicProgress(
                                  height: 10,
                                  percent: SkillsModel.getSkills()[index].percentage,
                                  duration: Duration(seconds: 1),
                                )
                              ]));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
