import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'register_step_1.dart';


class LoginOtp extends StatefulWidget {
  @override
  _LoginOtp createState() => new _LoginOtp();
}

class _LoginOtp extends State<LoginOtp> {
  TextEditingController otp1 =TextEditingController();
  String get _otp1 => otp1.text;
  TextEditingController otp2 =TextEditingController();
  String get _otp2 => otp2.text;
  TextEditingController otp3 =TextEditingController();
  String get _otp3 => otp3.text;
  TextEditingController otp4 =TextEditingController();
  String get _otp4 => otp1.text;
  TextEditingController otp5 =TextEditingController();
  String get _otp5 => otp5.text;
  TextEditingController otp6 =TextEditingController();
  String get _otp6 => otp1.text;

  late Timer _timer,_timer2;
  int time = 10;
  void startTimer() {
    time = 10;
    _timer =  Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) => {
          if (time == 0) {
            _timer.cancel()
          } else {
            setState(() {
              time=time - 1;
            })

            }

          }
    );
  }
  void initState() {
    startTimer();
  }
  void OnVerify(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return RegisterStep1();
    }));

  }
  Widget build(BuildContext context) {
    double unit=(MediaQuery.of(context).size.height)*heightunit+(MediaQuery.of(context).size.width)*widthunit;
    return WillPopScope(
        onWillPop: () async {
      _timer.cancel();
      return true;
    },
     child: Scaffold(
      body: SafeArea(
        child: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: MyBodyHeader(context)
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25*unit, 0, 25*unit),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send_to_mobile ,
                        color: bluecolor,
                        size: 30*unit,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                      MyText(context," OTP",TextAlign.center,redcolor,30*unit,FontWeight.bold),
                    ],
                  ),
                ),
                MyText(context,"OTP was sended in",TextAlign.center,blackcolor,17*unit,FontWeight.normal),
                MyText(context,"Mobile Number",TextAlign.center,blackcolor,17*unit,FontWeight.w600),
                Container(
                  width: 280*unit,
                  margin: EdgeInsets.only(top: 40*unit),
                  child:Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          otptextfield(context,40*unit,otp1,1),
                          otptextfield(context,40*unit,otp2,2),
                          otptextfield(context,40*unit,otp3,3),
                          otptextfield(context,40*unit,otp4,4),
                          otptextfield(context,40*unit,otp5,5),
                          otptextfield(context,40*unit,otp6,6),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10*unit),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap:(){
                                if(time==0){

                                }
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.refresh ,
                                    color: time!=0?greycolor:blackcolor,
                                    size: 15*unit,
                                    semanticLabel: 'Text to announce in accessibility modes',
                                  ),
                                  MyText(context," Resend",TextAlign.center,time!=0?greycolor:blackcolor,17*unit,FontWeight.normal),

                                ],
                              ),
                            ),
                            MyText(context,(time/60).toInt().toString()+":"+(time%60).toString(),TextAlign.center,time!=0?bluecolor:redcolor,17*unit,FontWeight.normal),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 85*unit),
                    child: RightIconBtn(context,Icons.done,bluecolor,"Verify",20.0*unit,45*unit,280*unit,OnVerify)
                ),
              ],
            ),
          ),
        ),
      ),
     ),
    );
  }
}