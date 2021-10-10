
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'register_step_3.dart';
class RegisterStep2 extends StatefulWidget {
  @override
  _RegisterStep2 createState() => new _RegisterStep2();
}

class _RegisterStep2 extends State<RegisterStep2> {
  TextEditingController mobailno = TextEditingController();

  String get _mobailno => mobailno.text;
  bool isChecked1 = false;
  bool isChecked2 = false;

  void onback() {
    aleart(context, "Print Some error ", false);
  }

  void onsubmit() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return RegisterStep3();
    }));
  }

  Widget build(BuildContext context) {
    double w = (MediaQuery
        .of(context)
        .size
        .width);
    double unit = (MediaQuery
        .of(context)
        .size
        .height) * heightunit + (MediaQuery
        .of(context)
        .size
        .width) * widthunit;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppHeader(context, 2, Icons.local_hospital_outlined,
                  "Hospital Imformation"),
              Padding(
                  padding: EdgeInsets.only(top: 30 * unit),
                  child: MyTextField(
                      context,
                      Icons.mobile_friendly,
                      "(on progress)",
                      20 * unit,
                      TextInputType.phone,
                      false,
                      mobailno,
                      35 * unit,
                      300 * unit)
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15 * unit),
                  child: MyTextField(
                      context,
                      Icons.mobile_friendly,
                      "(on progress)",
                      20 * unit,
                      TextInputType.phone,
                      false,
                      mobailno,
                      35 * unit,
                      300 * unit)
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15 * unit),
                  child: MyTextField(
                      context,
                      Icons.mobile_friendly,
                      "(on progress)",
                      20 * unit,
                      TextInputType.phone,
                      false,
                      mobailno,
                      35 * unit,
                      300 * unit)
              ),
              Padding(
                padding: EdgeInsets.only(top: 20 * unit),
                child: Container(
                  width: 300 * unit,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked1 = value!;
                              });
                            },
                            value: isChecked1,
                            activeColor: bluecolor,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 0 * unit),
                              child: MyText(context,
                                  "I would like to participate in medella's emergency response program that grants all licensed providers to view your "
                                      "records in case of emergency or immediate need. ",
                                  TextAlign.start, greycolor, 15 * unit,
                                  FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10 * unit),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked2 = value!;
                                });
                              },
                              value: isChecked2,
                              activeColor: bluecolor,
                            ),

                            Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(top: 0 * unit),
                                  child: MyText(context,
                                      "I agree to the terms and conditions stated here ",
                                      TextAlign.start, greycolor, 15 * unit,
                                      FontWeight.normal)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80 * unit),
                child: Container(
                  width: 300 * unit,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LeftIconBtn(
                          context,
                          Icons.arrow_back,
                          redcolor,
                          "Back",
                          20.0 * unit,
                          45 * unit,
                          145 * unit,
                          onback),
                      LeftIconBtn(
                          context,
                          Icons.done,
                          bluecolor,
                          "Submit",
                          20.0 * unit,
                          45 * unit,
                          145 * unit,
                          onsubmit)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}