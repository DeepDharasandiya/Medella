
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'dart:math' as math;

import 'home_page.dart';
class RegisterStep3 extends StatefulWidget {
  @override
  _RegisterStep3 createState() => new _RegisterStep3();
}

class _RegisterStep3 extends State<RegisterStep3> with SingleTickerProviderStateMixin {
  bool isfailed=false;
  bool issuccess=false;
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3),)..repeat();
  }

  void onbackstart() {
    Navigator.popUntil(context, (Route<dynamic> predicate) => predicate.isFirst);
  }
  void gofailed(){
    setState(() {
      issuccess=false;
      isfailed=true;
    });
  }
  void gossuccess()async{
    setState(() {
      issuccess=true;
      isfailed=false;
    });
    await aleart(context, "Medella Successfully created your account", true);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return HomePage();
    }));

  }


  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width);
    double unit = (MediaQuery.of(context).size.height) * heightunit + (MediaQuery.of(context).size.width) * widthunit;
   return WillPopScope(
        onWillPop: () async {
            _controller.dispose();
            super.dispose();

          return true;
        },
    child: Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppHeader(context, (isfailed || issuccess)?4:3, Icons.person_add_alt_1 ,
                  "Medella Create Profile"),
           isfailed ==false?  Container(
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
                         Icon(
                            Icons.access_time,
                            color: bluecolor,
                            size: 20*unit,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),

                          MyText(context," Please Wait",TextAlign.center,greycolor,20*unit,FontWeight.w800)
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10*unit),
                        child: MyText(context,"Checking Profile Data",TextAlign.center,greycolor,20*unit,FontWeight.normal)
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10*unit),
                        child: LeftIconBtn(context,Icons.arrow_back,redcolor,"temp. click for success",20.0*unit,45*unit,300*unit,gossuccess)
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10*unit),
                        child: LeftIconBtn(context,Icons.arrow_back,redcolor,"temp. click for failed",20.0*unit,45*unit,300*unit,gofailed)
                    ),
                  ],
                ),
              ):
              Container(
                width: 300*unit,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15*unit),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.cancel_outlined,
                            color: redcolor,
                            size: 25*unit,
                            semanticLabel: 'Text to announce in accessibility modes',
                          ),
                          MyText(context," Account creation failed",TextAlign.center,redcolor,20*unit,FontWeight.normal)
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left:25*unit,top: 10*unit),
                        child: Row(
                          children: [
                            MyText(context," Reason",TextAlign.center,greycolor,20*unit,FontWeight.normal),
                          ],
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 370*unit),
                        child: LeftIconBtn(context,Icons.arrow_back,redcolor,"Back to Starting Page",20.0*unit,45*unit,300*unit,onbackstart)
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    ),
    );
  }
}