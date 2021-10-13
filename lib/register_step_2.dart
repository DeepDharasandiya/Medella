import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/api.dart';
import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'register_step_3.dart';
class RegisterStep2 extends StatefulWidget {
  RegisterStep2(this.token,this.name,this.security,this.dob,this.profile_image,this.id_image);
  String token, name,security,dob,profile_image,id_image;
  @override
  _RegisterStep2 createState() => new _RegisterStep2(token,name,security,dob,profile_image,id_image);
}

class _RegisterStep2 extends State<RegisterStep2> {
  _RegisterStep2(token,name,security,dob,profile_image,id_image);

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isloading=true;
  var statedata=[];
  var citydata=[],hospitaldata=[];
  String city='';
  String state='';
  String hospital='';

  @override
  void initState() {
    getstatedata();
  }
  void getstatedata()async{
    var res = await getstate(context, "United States");
    print(res.body);
    if(res.statusCode==200){
      var data=json.decode(res.body);
      setState(() {
        statedata=data;
        isloading=false;
      });
    }else{
      setState(() {
        isloading=false;
      });
      aleart(context, "Not fetching data", false);
    }
  }
  void getcitydata(String statename)async{
    var res = await getcity(context, statename);
    if(res.statusCode==200){
      var data=json.decode(res.body);
      setState(() {
        city=data[0]['city_name'];
        citydata=data;
      });
    }else{
      setState(() {
        isloading=false;
      });
      aleart(context, "Not fetching data", false);
    }
  }
  void onback() {
    Navigator.pop(context);
  }

  void onsubmit() {
    if(state != '' && city != '' && hospital != ''){
      if(isChecked1 ==true && isChecked2 ==true){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return RegisterStep3(widget.token,widget.name,widget.security,widget.dob,widget.profile_image,widget.id_image,state,city,hospital);
        }));
      }else{
        aleart(context, "Please Accept the Terms & Conditions", false);
      }
    }else{
      aleart(context, "All Details are Required.", false);
    }

  }

  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width);
    double unit = (MediaQuery.of(context).size.height) * heightunit + (MediaQuery.of(context).size.width) * widthunit;
    return Scaffold(
      body: SafeArea(
        child: isloading==false?SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppHeader(context, 2, Icons.local_hospital_outlined,
                    "Hospital Information"),
                Padding(
                    padding: EdgeInsets.only(top: 30 * unit),
                    child: Container(
                      padding: EdgeInsets.only(left: 20*unit,right:20*unit),
                      width: 300*unit,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: bluecolor,
                          width: 3*unit,
                        ),
                        borderRadius: BorderRadius.circular(30*unit),
                      ),
                      child:Row(
                        children: [
                          Container(
                            width:50*unit,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_city_rounded,
                                  color: bluecolor,
                                  size: 25*unit,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(10*unit, 0, 10*unit, 0),
                                    child: VerticalLine(context,1.5*unit,25*unit)
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: DropdownButtonFormField<dynamic>(
                              isExpanded: true,
                              hint: MyText(context,"State",TextAlign.start,greycolor,15*unit,FontWeight.normal),
                              items: statedata.map((label) => DropdownMenuItem(
                                child: MyText(context,label["state_name"],TextAlign.start,blackcolor,18*unit,FontWeight.normal),
                                value: label["state_name"],
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                   state=value;
                                });
                                getcitydata(state);
                              },
                            ),
                          ),
                         ],
                      ),
                    ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10 * unit),
                  child: Container(
                    padding: EdgeInsets.only(left: 20*unit,right:20*unit),
                    width: 300*unit,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: bluecolor,
                        width: 3*unit,
                      ),
                      borderRadius: BorderRadius.circular(30*unit),
                    ),
                    child:Row(
                      children: [
                        Container(
                          width:50*unit,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_city_rounded,
                                color: bluecolor,
                                size: 25*unit,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10*unit, 0, 10*unit, 0),
                                  child: VerticalLine(context,1.5*unit,25*unit)
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<dynamic>(
                            isExpanded: true,
                            hint: MyText(context,"City",TextAlign.start,greycolor,15*unit,FontWeight.normal),
                            items: citydata.map((label) => DropdownMenuItem(
                              child: MyText(context,label["city_name"],TextAlign.start,blackcolor,18*unit,FontWeight.normal),
                              value: label["city_name"],
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                city=value;
                              });
                              //getcitydata(value);
                            },
                              value:city,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10 * unit),
                  child: Container(
                    padding: EdgeInsets.only(left: 20*unit,right:20*unit),
                    width: 300*unit,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: bluecolor,
                        width: 3*unit,
                      ),
                      borderRadius: BorderRadius.circular(30*unit),
                    ),
                    child:Row(
                      children: [
                        Container(
                          width:50*unit,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.local_hospital,
                                color: bluecolor,
                                size: 25*unit,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                              Padding(
                                  padding: EdgeInsets.fromLTRB(10*unit, 0, 10*unit, 0),
                                  child: VerticalLine(context,1.5*unit,25*unit)
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            isExpanded: true,
                            hint: MyText(context,"Hospital Network",TextAlign.start,greycolor,18*unit,FontWeight.normal),
                            items: ["abc", "mno", "pqr"]
                                .map((label) => DropdownMenuItem(
                              child: MyText(context,label,TextAlign.start,blackcolor,18*unit,FontWeight.normal),
                              value: label,
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                hospital=value!;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
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
                        LeftIconBtn(context, Icons.arrow_back, redcolor, "Back", 20.0 * unit, 45 * unit, 145 * unit, onback),
                        LeftIconBtn(context, Icons.done, bluecolor, "Submit", 20.0 * unit, 45 * unit, 145 * unit, onsubmit)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ):
        progressindicator(context),
      ),
    );
  }
}