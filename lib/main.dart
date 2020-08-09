import 'package:bmicalc/utils.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'paage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Paages page = Paages.gender;
  bool isMale = true;
  double height,weight;
  int heights = 165;
  getWidth(double height) => (height / 4 + height / 8)*(weight/55);
  getHeight(bool isPicked) => (isPicked) ? height*(heights/165) : height * 0.8;
  @override
  initState() {
    weight = 55;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = (page == Paages.gender) ? 200 : (page == Paages.body) ? 280 : 240;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(children: [
                Positioned.fill(
                    child: Container(
                  width: double.infinity,
                  height: double.infinity,
                )),
                AnimatedPositioned(
                    duration: Duration(milliseconds: 250),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: 25),
                            child: Text(getTitle(page),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))))),
                AnimatedPositioned(
                    left: (page == Paages.gender && isMale) ? -300 : null,
                    right: (page == Paages.gender && !isMale) ? -300 : null,
                    duration: Duration(milliseconds: 250),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: 70),
                            child: Text(
                                (page == Paages.result)
                                    ? 'your BMI is ${calculateBmi(weight.toDouble(), heights / 100).toStringAsFixed(1)}'
                                    : 'height $heights Cm and weight $weight kg',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))))),
                AnimatedPositioned(
                    left: (page != Paages.result && isMale) ? -300 : null,
                    right: (page != Paages.result && !isMale) ? -300 : null,
                    duration: Duration(milliseconds: 250),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: 100),
                            child: getTextWeightStats(calculateBmi(weight,
                                heights / 100))))),
                AnimatedPositioned(
                    bottom:
                        ((page != Paages.gender && isMale) ? 2.0 : 0.0) * 1 +
                            150,
                    curve: Curves.easeInOut,
                    left: (page != Paages.gender && !isMale)
                        ? -200
                        : (page != Paages.gender && isMale)
                            ? width / 2.9 
                            : width / 3.5,
                    duration: Duration(milliseconds: 250),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: AnimatedContainer(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://i.ibb.co/pxjXdV3/9e502f93-db38-484a-b8af-e9dcee00e66f.png'),
                                  fit: BoxFit.fill)),
                          duration: Duration(milliseconds: 100),
                          width: getWidth(getHeight(isMale)),
                          height: getHeight(isMale),
                        ))),
                AnimatedPositioned(
                    bottom:
                        ((page != Paages.gender && !isMale) ? 2.0 : 0.0) * 1 +
                            150,
                    right: (page != Paages.gender && isMale)
                        ? -200
                        : (page != Paages.gender && !isMale)
                            ? width / 2.6
                            : width / 3.5,
                    duration: Duration(milliseconds: 100),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://i.ibb.co/KFxTf5D/a6597615-c147-4b6a-b01d-533abb906b6e.png'),
                                fit: BoxFit.fill)),
                        duration: Duration(milliseconds: 100),
                        width: getWidth(getHeight(!isMale)),
                        height: getHeight(!isMale),
                      ),
                    )),
                AnimatedPositioned(
                    left: (page != Paages.gender && isMale) ? -200 : null,
                    right: (page != Paages.gender && !isMale) ? -200 : null,
                    duration: Duration(milliseconds: 250),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                            margin: EdgeInsets.only(top: 100),
                            child: Text((isMale) ? ' Male ' : ' Female ',
                                style: TextStyle(
                                    color: (isMale) ? Colors.red : Colors.pink,
                                    fontWeight: FontWeight.w600))))),
                AnimatedPositioned(
                    bottom: 318,
                    left: ((page == Paages.body) ? -140 : -300),
                    duration: Duration(milliseconds: 250),
                    child: Transform.rotate(
                        angle: -3.1415926535897932 / 2,
                        child: Container(
                            height: 15,
                            width: 330,
                            child: Stack(children: [
                              AnimatedContainer(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all()),
                                  duration: Duration(milliseconds: 100),
                                  width: 350,
                                  height: 20),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.red,
                                  inactiveTrackColor: Colors.white,
                                  trackShape: RoundedRectSliderTrackShape(),
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 2),
                                  trackHeight: 8.0,
                                  thumbColor: Colors.black,
                                  showValueIndicator: ShowValueIndicator.always,
                                  overlayColor: Colors.red.withAlpha(32),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 10.0),
                                  valueIndicatorShape:
                                      PaddleSliderValueIndicatorShape(),
                                  valueIndicatorColor: Colors.redAccent,
                                  valueIndicatorTextStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Slider(
                                    min: 0,
                                    max: 200,
                                    onChanged: (val) {
                                      setState(() {
                                        if (val > 100) heights = val.toInt();
                                      });
                                    },
                                    value: heights.toDouble()),
                              ),
                            ])))),
                AnimatedPositioned(
                    right: (page == Paages.body) ? 10 : -250,
                    top: 250,
                    duration: Duration(milliseconds: 250),
                    child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://i.ibb.co/4tM0njY/c4c85ac3-7326-46f4-8fdf-b3c560788edc.png'))))),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 50),
                        width: width / 9,
                        height: 50,
                        child: (page != Paages.result)
                            ? IconButton(
                                icon: Icon(Icons.arrow_forward_ios),
                                onPressed: () {
                                  setState(() {
                                    switch (page) {
                                      case Paages.gender:
                                        page = Paages.body;
                                        break;
                                      case Paages.body:
                                        page = Paages.result;
                                        break;
                                      case Paages.result:
                                        page = Paages.gender;
                                        break;
                                    }
                                  });
                                })
                            : IconButton(
                                icon: Icon(Icons.refresh),
                                onPressed: () {
                                  setState(() {
                                   weight = 55;
                                    heights = 165;
                                    page = Paages.gender;
                                  });
                                },
                              ),
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle))),
                AnimatedPositioned(
                    right: (page == Paages.body) ? 15 : -250,
                    top: 210,
                    duration: Duration(milliseconds: 250),
                    child: Container(
                        width: 90,
                        height: 40,
                        child: Stack(children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Transform.rotate(
                                  angle: 40,
                                  child: Container(
                                      color: Color.fromRGBO(222, 221, 222, 1),
                                      width: 20,
                                      height: 20))),
                          Positioned(
                              child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(222, 221, 222, 1),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  width: 90,
                                  height: 32,
                                  
                                  )),Align(
                                    alignment:Alignment.center,
                                    child: 
                                     NumberPicker.integer(
                                       highlightSelectedValue: false,
                                          listViewWidth: 50,
                initialValue: weight.toInt()+1,
                minValue: 20,
                maxValue: 150,
                scrollDirection: Axis.horizontal,
                onChanged: (num){
                  setState(() {
                     weight=num.toDouble()-1;
                  });
                 
                }))
                        ])))
              ])),
        ));
  }
}
