import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp( MaterialApp( debugShowCheckedModeBanner:false,home:MyApp() ));
}

class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => new _MyApp();
}

class _MyApp extends State<MyApp> {
  void OnLogin(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Login();
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
                    padding: EdgeInsets.only(top: 0),
                    child: MyBodyHeader(context)
                ),
                Padding(
                    padding: EdgeInsets.only(top: 40*unit),
                    child: MyText(context,"Welcome To Medella\nContinue with",TextAlign.center,greycolor,17*unit,FontWeight.w800)
                ),
                Padding(
                    padding: EdgeInsets.only(top: 160*unit,bottom: 20*unit),
                    child: LeftIconBtn(context,Icons.login,bluecolor,"Login",20.0*unit,45*unit,280*unit,OnLogin)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}