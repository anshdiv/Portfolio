import 'package:anshulportfolio/screens/intro.dart';
import 'package:anshulportfolio/screens/projects.dart';
import 'package:anshulportfolio/screens/skills.dart';
import 'package:anshulportfolio/theme/hex_color.dart';
import 'package:anshulportfolio/theme/theme.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anshul',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: NeumorphicTheme(
          usedTheme: UsedTheme.LIGHT,
          theme: NeumorphicThemeData(
            baseColor: Color(0xFFDBE6E8),
            lightSource: LightSource.topLeft,
            depth: 10,
          ),
          darkTheme: NeumorphicThemeData(
            baseColor: Color(0xFF3E3E3E),
            lightSource: LightSource.topLeft,
            depth: 6,
          ),
          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex=0;
  PageController _pageController =
      PageController(keepPage: true, initialPage: 0);

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        PageView(
          onPageChanged: (index){
            _pageIndex=index;
          },
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          controller: _pageController,
          children: <Widget>[
            Intro(),
            Skills(),
            Projects(),
          ],
        ),
        Positioned.fill(
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: 20,top: 20),
                  child: SmoothPageIndicator(
                    count: 3,
                    controller: _pageController,
                    effect: ExpandingDotsEffect(activeDotColor:HexColor("2196F3"),dotWidth: 8, dotHeight: 4),
                  ))),
        ),
        Visibility(
          visible: false,
          child: Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: (){
                    _pageController.animateToPage(
                      _pageIndex+1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,);
                  },
                  child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: DelayedDisplay(
                          fadingDuration: Duration(seconds: 3),
                          delay: Duration(seconds: 10),
                          child: Image.asset(
                            "assets/images/down.png",
                            height: 30,
                            color: Colors.grey,
                          ))),
                )),
          ),
        )
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
