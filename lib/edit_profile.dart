import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'Components/api.dart';
import 'Components/const_details.dart';
import 'Components/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfile createState() => new _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  TextEditingController name =TextEditingController();
  String get _name => name.text;
  String username='';
  bool istextedit=false;
  bool isimageedit=false;
  bool isloading =true;
  String profilelink='';
  late Future<dynamic> file;
  String base64Image = '';
  String path = '';
  var _image;
  var userdata;

  @override
  void initState() {
    getdata();
  }

  void  oneditdone() {

  }

  void onchooseimage()async{
    try {
      ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      print(File(image!.path));
      final bytes = File(image.path)
          .readAsBytesSync()
          .lengthInBytes;
      final kb = bytes / 1024;
      if (kb <= 100) {
        final imageBytes = File(image.path).readAsBytesSync();
        String base64 = base64Encode(imageBytes);
        setState(() {
          _image = File(image.path);
          path=image.path;
          base64Image = base64;
          isimageedit = true;
        });
      } else {
        aleart(context, "Please Select file less than 100KB", false);
      }
    }catch (error) {
        aleart(context, "File Not Picked", false);
    }

  }
  void updatedata()async{
    setState(() {
      isloading=true;
    });
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token=prefs.getString('token');
    if(istextedit && isimageedit){
      var body={
        "username":_name,
        "dob":userdata["dob"],
        "mobile":userdata["mobile"],
        "social_security":userdata["social_security"],
        "country":userdata["country"],
        "state":userdata["state"],
        "city":userdata["city"],
        "hospial_network":userdata["hospial_network"]
      };

      var res = await updatedetails(context, "/api/v1/users/updateMe",token.toString(),body);
      if(res.statusCode == 200){
        var data=json.decode(res.body);
        print(data);
        var body2={
          "user_image":base64Image,
        };
        var res2 = await updatedetails(context, "/api/v1/users/updateDP",token.toString(),body2);
        if(res2.statusCode == 200){
          var data2=json.decode(res2.body);
          print(data2);
          setState(() {
            isloading=false;
          });
          await aleart(context, "Data Updates Successfully.", true);
          Navigator.pop(context);

        }else{
          setState(() {
            isloading=false;
          });
          aleart(context, "Server Didn't response", false);
        }

      }else{
        setState(() {
          isloading=false;
        });
        aleart(context, "Server Didn't response", false);
      }
    }else if(istextedit){
      var body={
        "username":_name,
        "dob":userdata["dob"],
        "mobile":userdata["mobile"],
        "social_security":userdata["social_security"],
        "country":userdata["country"],
        "state":userdata["state"],
        "city":userdata["city"],
        "hospial_network":userdata["hospial_network"]
      };
      var res = await updatedetails(context, "/api/v1/users/updateMe",token.toString(),body);
      if(res.statusCode == 200){
        var data=json.decode(res.body);
        print(data);
        setState(() {
          isloading=false;
        });
        await aleart(context, "Data Updates Successfully.", true);
      }else{
        setState(() {
          isloading=false;
        });
        await aleart(context, "Server Didn't response", false);
        Navigator.pop(context);

      }
    }else if(isimageedit){
      print(base64Image);
      var body={
        "user_image":await _image.readAsBytesSync().toString()
      };
      var res = await updatedetails(context, "/api/v1/users/updateDP",token.toString(),body);
      print(res.body);
      if(res.statusCode == 200){
        var data=json.decode(res.body);
        print(data);
        setState(() {
          isloading=false;
        });
        await aleart(context, "Server Didn't response", false);
        Navigator.pop(context);

      }else{
        setState(() {
          isloading=false;
        });
        aleart(context, "Server Didn't response", false);
      }
    }else {
      setState(() {
        isloading=false;
      });
      Navigator.pop(context);
    }

  }
  void getdata()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token=prefs.getString('token');
    print("token = " +token.toString());
    var res = await getdetails(context, "/api/v1/users/getMe",token.toString(),);
    if(res.statusCode == 200){
      var data=json.decode(res.body);
      print(data['data']);
      setState(() {
        userdata=data["data"];
        profilelink=data['data']['user_image'];
        username=data['data']['username'];
        name =TextEditingController(text: data['data']['username']);
        isloading=false;
      });

    }else{
      setState(() {
        isloading=false;
      });
      aleart(context, "Server Didn't response", false);
    }
  }



  Widget build(BuildContext context) {
    double w=(MediaQuery.of(context).size.width);
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
                  updatedata();
                },
                child: MyText(context,"Save",TextAlign.center,bluecolor,12*unit,FontWeight.w600),
              )
          ),
        ],
      ),
      body: SafeArea(
        child: isloading==false?SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:10*unit),
                  child: Container(
                    width: w,
                    child:Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: (w-300*unit)/2,top: 20*unit),
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_circle,
                                color: bluecolor,
                                size: 25*unit,
                                semanticLabel: 'Text to announce in accessibility modes',
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10*unit),
                                  child: MyText(context,"Edit Profile",TextAlign.start,bluecolor,20*unit,FontWeight.w600)
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: w,
                  child:Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: (w-300*unit)/2,top: 10*unit),
                          child:HorizontalLine(context,w-((w-300*unit)/2),3*unit)
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(top:30*unit),
                  child: Container(
                    width: 300*unit,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isimageedit=true;
                            });
                            onchooseimage();
                          },
                          child: Container(
                            height: 100*unit,
                            width:100*unit,
                            decoration: BoxDecoration(
                              color: whitecolor,
                              image:(isimageedit && base64Image!='')?DecorationImage(
                                image: FileImage(_image),
                                fit: BoxFit.cover,
                              ):DecorationImage(
                                image: NetworkImage(profilelink),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                color: bluecolor,
                                width: 2*unit,
                              ),
                              borderRadius: BorderRadius.circular(50*unit),
                            ),
                          ),
                        ),

                        istextedit==false?Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                istextedit=true;
                              });
                            },
                              child: Padding(
                                padding: EdgeInsets.only(left: 15*unit),
                                child:  MyText(context,username,TextAlign.start,blackcolor,20*unit,FontWeight.w500),
                              ),
                          ),
                        ):Container(),


                      istextedit?Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 15*unit),
                          child: Container(
                            width:180*unit,
                            child: TextField(
                              controller: name,
                              style: TextStyle(
                                  fontSize: 20*unit,
                                  color: blackcolor,
                                  fontWeight: FontWeight.w500,
                              ),
                               decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: 'Username',
                               ),
                            ),
                             ),
                        ),
                      ):Container(),
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