import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:anshulportfolio/theme/colors.dart';
import 'package:anshulportfolio/theme/hex_color.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Intro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return IntroState();
  }

}

class IntroState extends State<Intro>{
  bool isShown;
  @override
  void initState() {
    super.initState();
    isShown=false;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NeumorphicBackground(
        backendColor: Colors.white,
        margin: EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(10),
        child: Neumorphic(
          child: Stack(
            children: <Widget>[
              Positioned.fill(top:20,
                  child: Align(alignment:Alignment.topCenter,
                  child: Text("INTRODUCTION",textAlign: TextAlign.center,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,)))),
              Positioned(child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Neumorphic(
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(200))),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        depth: 8,

                      ),
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset('assets/images/dp.jpg',width: 200,height: 200,fit: BoxFit.fill,)
                        ),
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 30,right:20,left: 20),
                      width: double.maxFinite,
                      child: Text("Namaste,",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),
                  Container(
                      width: double.maxFinite,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("I'm",style: TextStyle(color:Colors.black,fontSize:24,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          TyperAnimatedTextKit(
                            speed: Duration(milliseconds: 200),
                            isRepeatingAnimation: false,
                            text: [' Anshul Gour'],
                            textAlign: TextAlign.center,
                            textStyle: TextStyle(color:HexColor("2196F3"),fontSize:24,fontWeight: FontWeight.bold),
                          )

                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 30,right:20,left: 20),
                      width: double.maxFinite,
                      child: DelayedDisplay(
                          delay: Duration(seconds: 3),
                          child: Text("Techy who primarliy develop mobile application but also have experienced in API development as well.\nOther than development I do travel,read books, write blogs and Yes I also cook some amazing dishes as well.",style: TextStyle(fontSize:16,color:HexColor("2196F3"),fontWeight: FontWeight.w500),textAlign: TextAlign.center,))),
                ],
              ),)
            ],
          ),
        ),
      ),
    );
  }

}