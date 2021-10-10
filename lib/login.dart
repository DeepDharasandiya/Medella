import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'login_otp.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  TextEditingController mobailno =TextEditingController();
  String get _mobailno => mobailno.text;
  void OnSentOtp(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LoginOtp();
    }));
  }
  Widget build(BuildContext context) {
    double unit=(MediaQuery.of(context).size.height)*heightunit+(MediaQuery.of(context).size.width)*widthunit;
    return Scaffold(
      body: SafeArea(
          child:Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top:0),
                      child: MyBodyHeader(context)
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25*unit),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          color: bluecolor,
                          size: 30*unit,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                        MyText(context," Login",TextAlign.center,redcolor,30*unit,FontWeight.bold),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25*unit),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(context,"We will send you an ",TextAlign.center,blackcolor,17*unit,FontWeight.normal),
                        MyText(context,"One Time",TextAlign.center,blackcolor,17*unit,FontWeight.w600),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(context,"Password",TextAlign.center,blackcolor,17*unit,FontWeight.w600),
                      MyText(context," on the Mobail",TextAlign.center,blackcolor,17*unit,FontWeight.normal),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 25*unit),
                      child: MyTextField(context,Icons.mobile_friendly,"Mobile Number",20*unit,TextInputType.phone,false,mobailno,50*unit,280*unit)
                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 130*unit),
                      child: LeftIconBtn(context,Icons.send_outlined,bluecolor,"Send OTP",20.0*unit,45*unit,280*unit,OnSentOtp)
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}