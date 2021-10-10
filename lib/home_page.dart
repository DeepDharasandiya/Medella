import 'package:flutter/material.dart';

import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'edit_profile.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<HomePage> {
  void onprofile() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return EditProfile();
    }));
  }
  void onverification(){

  }

  Widget build(BuildContext context) {
    double unit = (MediaQuery.of(context).size.height) * heightunit + (MediaQuery.of(context).size.width) * widthunit;
    return Scaffold(
      appBar: AppBar(
       title: Image.asset('Assets/logo_horizontal.png',
        fit: BoxFit.contain,
        height: 35*unit,
      ),
        backgroundColor: whitecolor,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20*unit),
              child: GestureDetector(
                onTap: () {
                  onprofile();
                },
                child: Icon(
                  Icons.account_circle,
                  color: bluecolor,
                  size: 30*unit,
                ),
              )
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 20*unit),
                    child: RightIconBtn(context,Icons.domain_verification ,bluecolor,"Vaccine Verification",20.0*unit,45*unit,280*unit,onverification)
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}