
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'register_step_2.dart';
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
class RegisterStep1 extends StatefulWidget {
  @override
  _RegisterStep1 createState() => new _RegisterStep1();
}

class _RegisterStep1 extends State<RegisterStep1> {
  TextEditingController name = TextEditingController();
  String get _name => name.text;
  TextEditingController dob = TextEditingController();
  String get _dob => dob.text;
  TextEditingController mobailno = TextEditingController();
  String get _mobailno => mobailno.text;


  late Future<dynamic> file;
  String base64Image = '';
  String path = '';
  var _image;

  void onchooseimage()async{
    try {
      ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      final bytes = File(image!.path)
          .readAsBytesSync()
          .lengthInBytes;
      final kb = bytes / 1024;
      if (kb <= 100) {
        final imageBytes = File(image.path).readAsBytesSync();
        String base64 = base64Encode(imageBytes);
        setState(() {
          _image = File(image.path);
          base64Image = base64;
        });
      } else {
        aleart(context, "Please Select file less than 100KB", false);
      }
    }catch (error) {
      aleart(context, "File Not Picked", false);
    }

  }

  void onnext() {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return RegisterStep2();
    }));
  }
  String dob1="Date of Birth";
  void date(double unit)async{
    DateTime? newDateTime = await showRoundedDatePicker(
      height: 200.0*unit,
      context: context,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year+10),
      initialDatePickerMode: DatePickerMode.year,
      theme: ThemeData(primarySwatch: Colors.blue),
    );
    setState(() {
      dob1 = (newDateTime!.year).toString()+"-"+(newDateTime.month).toString()+"-"+(newDateTime.day).toString();
    });
  }

  Widget build(BuildContext context) {
    double w = (MediaQuery.of(context).size.width);
    double unit = (MediaQuery.of(context).size.height) * heightunit + (MediaQuery.of(context).size.width) * widthunit;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppHeader(context, 1, Icons.person , "Personal Imformation"),
                Padding(
                  padding: EdgeInsets.only(top: 20 * unit),
                  child: GestureDetector(
                    onTap: () {
                      onchooseimage();
                    },
                    child: base64Image!=''?Container(
                      height: 100*unit,
                      width:100*unit,
                      decoration: BoxDecoration(
                        color: whitecolor,
                        image: DecorationImage(
                          image: FileImage(_image),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: bluecolor,
                          width: 2*unit,
                        ),
                        borderRadius: BorderRadius.circular(50*unit),
                      ),
                    ): Container(
                      height: 100*unit,
                      width:100*unit,
                      decoration: BoxDecoration(
                        color: whitecolor,
                        border: Border.all(
                          color: bluecolor,
                          width: 2*unit,
                        ),
                        borderRadius: BorderRadius.circular(50*unit),
                      ),
                      child:Container(
                        width: 100*unit,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.upload_rounded,
                              color: greycolor,
                              size: 25*unit,
                              semanticLabel: 'Text to announce in accessibility modes',
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10*unit,right:10*unit),
                              child: Row(
                                children: [
                                  Expanded(child: MyText(context,"Upload profile pick ",TextAlign.center,greycolor,12*unit,FontWeight.w400)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20 * unit),
                    child: MyTextField(
                        context, Icons.person, "Name", 20 * unit, TextInputType.text,
                        false, name, 35 * unit, 300 * unit)
                ),

                Padding(
                    padding: EdgeInsets.only(top: 10 * unit),
                    child: MyTextField(
                        context, Icons.security , "Social Security", 20 * unit, TextInputType.text,
                        false, name, 35 * unit, 300 * unit)
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10 * unit),
                    child:InkWell(
                      onTap: () {
                        date(unit);
                      },
                      child: Container(
                        width: 300*unit,
                        height: 48*unit,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: bluecolor,
                            width: 3*unit,
                          ),
                          borderRadius: BorderRadius.circular(40*unit),
                        ),
                        padding: EdgeInsets.only(left:20*unit,right: 20*unit),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.date_range,
                              color: bluecolor,
                              size: 25*unit,
                              semanticLabel: 'Text to announce in accessibility modes',
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10*unit, 0, 10*unit, 0),
                                child: VerticalLine(context,1.5*unit,25*unit)
                            ),
                            Padding(
                              padding: EdgeInsets.all(0),
                              child: MyText(context,dob1,TextAlign.start,greycolor,20*unit,FontWeight.normal),
                            ),

                          ],
                        ),
                      ),
                    )
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10 * unit),
                    child:InkWell(
                      onTap: () {
                      //  date(unit);
                      },
                      child: Container(
                        width: 300*unit,
                        height: 48*unit,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: bluecolor,
                            width: 3*unit,
                          ),
                          borderRadius: BorderRadius.circular(40*unit),
                        ),
                        padding: EdgeInsets.only(left:20*unit,right: 20*unit),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.contact_mail_rounded,
                              color: bluecolor,
                              size: 25*unit,
                              semanticLabel: 'Text to announce in accessibility modes',
                            ),
                            Padding(
                                padding: EdgeInsets.fromLTRB(10*unit, 0, 10*unit, 0),
                                child: VerticalLine(context,1.5*unit,25*unit)
                            ),
                            Padding(
                              padding: EdgeInsets.all(0),
                              child: MyText(context,"Upload Id",TextAlign.start,greycolor,20*unit,FontWeight.normal),
                            ),

                          ],
                        ),
                      ),
                    )
                ),
              /*  Padding(
                    padding: EdgeInsets.only(top: 10 * unit),
                    child:GestureDetector(
                      onTap: () {

                      },
                      child: MyTextField(
                          context, Icons.contact_mail_rounded , "Upload Id(on progress)", 20 * unit, TextInputType.text,
                          false, name, 35 * unit, 300 * unit)
                    )
                ),*/

                Padding(
                    padding: EdgeInsets.only(top: 60*unit),
                    child: RightIconBtn(context,Icons.arrow_forward ,bluecolor,"Next",20.0*unit,45*unit,280*unit,onnext)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}