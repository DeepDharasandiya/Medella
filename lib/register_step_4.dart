
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'dart:math' as math;
class RegisterStep3 extends StatefulWidget {
  @override
  _RegisterStep3 createState() => new _RegisterStep3();
}

class _RegisterStep3 extends State<RegisterStep3> with SingleTickerProviderStateMixin {

  TextEditingController mobailno = TextEditingController();

  String get _mobailno => mobailno.text;
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3),)..repeat();
  }

  void onnext() {

  }

  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width);
    double unit = (MediaQuery.of(context).size.height) * heightunit + (MediaQuery.of(context).size.width) * widthunit;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppHeader(context, 3, Icons.person_add_alt_1 ,
                  "Medella Create Profile"),
              Container(
                width: 300*unit,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 50*unit),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30*unit,top: 30*unit),
                            child: Image(image: AssetImage('Assets/onlylogo.png'),
                              height: 120*unit ,width: 120*unit,),
                          ),
                          Container(
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (_, child) {
                                return Transform.rotate(
                                  angle: _controller.value * 2 * math.pi,
                                  child: child,
                                );
                              },
                              child: Stack(
                                children: [
                                  Image(image: AssetImage('Assets/loadingback.png'),
                                      height: 180*unit ),
                                  Image(image: AssetImage('Assets/loadingfront.png'),
                                      height: 180*unit ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20*unit),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          imageicon(context,"clockicon.png",20*unit),
                          MyText(context," Please Wait",TextAlign.center,greycolor,20*unit,FontWeight.w800)
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10*unit),
                        child: MyText(context,"Checking Profile Data",TextAlign.center,greycolor,20*unit,FontWeight.normal)
                    )
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}