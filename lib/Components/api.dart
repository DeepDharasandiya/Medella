import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

import 'utils.dart';
var domain="http://31.220.59.179";

Future<bool> networkcheck(BuildContext context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi) {
    return Future<bool>.value(false);
  }
  else {
    return Future<bool>.value(true);
  }
}

Future<dynamic> api(BuildContext context,String name,String token,Object body) async {
  if(await networkcheck(context)==true) {
    var url = Uri.parse(domain+name);
    final response = await http.post(url,
        headers: {
          "authorization":"Bearer "+token,
        },
        body: body
    );
    return Future<dynamic>.value(response);
  }else{
    aleart(context, "Your Device not connected to Internet.", false);
    return Future<dynamic>.value(false);
  }
}
Future<dynamic> withotheaderapi(BuildContext context,String name,Object body) async {
  if(await networkcheck(context)==true) {
    var url = Uri.parse(domain+name);
    final response = await http.post(url,
        body: body
    );
    return Future<dynamic>.value(response);
  }else{
    aleart(context, "Your Device not connected to Internet.", false);
    return Future<dynamic>.value(false);
  }
}
Future<dynamic> getdetails(BuildContext context,String name,String token) async {
  if(await networkcheck(context)==true) {
    var url = Uri.parse(domain+name);
    final response = await http.get(url,
        headers: {
          "authorization":"Bearer "+token,
        },

    );
    return Future<dynamic>.value(response);
  }else{
    aleart(context, "Your Device not connected to Internet.", false);
    return Future<dynamic>.value(false);
  }
}
Future<dynamic> updatedetails(BuildContext context,String name,String token ,Object body) async {
  if(await networkcheck(context)==true) {
    var url = Uri.parse(domain+name);
    final response = await http.patch(url,
        headers: {
          "authorization":"Bearer "+token,
        },
        body: body
    );
    return Future<dynamic>.value(response);
  }else{
    aleart(context, "Your Device not connected to Internet.", false);
    return Future<dynamic>.value(false);
  }
}

/*Future<dynamic> updateImage(filepath, name,String token) async {
  var url = Uri.parse(domain+name);
  var request = http.MultipartRequest('patch',url);
  request.headers['authorization'] = "Bearer "+token;
  request.body.add(
      http.MultipartFile.fromBytes(
          'user_image',
          File(filepath).readAsBytesSync(),
          filename: filepath.split("/").last
      )
  );
  var res = await request.send();
  return res;
}*/


Future<dynamic> getstate(BuildContext context,String name) async {
  if(await networkcheck(context)==true) {
    var url = Uri.parse("https://www.universal-tutorial.com/api/states/"+name);
    final response = await http.get(url,
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJkZWVwcGF0ZWwxMjAxMjBAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiUHdaM2E1TXBYczF0ZWxNQ0Y1b3p0S2pDd1NjVnJkZlpiendlRWhyYkwxdXVQbjFQT2FRX3VtZ3prbnBUM3NIU0Q3RSJ9LCJleHAiOjE2MzQyMTQwNDN9.Ee3Y38HRbcOu_0-j606GwYSMZG2lbeopI-LFq4AUrSc",
        "Accept": "application/json"
      },

    );
    return Future<dynamic>.value(response);
  }else{
    aleart(context, "Your Device not connected to Internet.", false);
    return Future<dynamic>.value(false);
  }
}
Future<dynamic> getcity(BuildContext context,String name) async {
  if(await networkcheck(context)==true) {
    var url = Uri.parse("https://www.universal-tutorial.com/api/cities/"+name);
    final response = await http.get(url,
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJkZWVwcGF0ZWwxMjAxMjBAZ21haWwuY29tIiwiYXBpX3Rva2VuIjoiUHdaM2E1TXBYczF0ZWxNQ0Y1b3p0S2pDd1NjVnJkZlpiendlRWhyYkwxdXVQbjFQT2FRX3VtZ3prbnBUM3NIU0Q3RSJ9LCJleHAiOjE2MzQyMTQwNDN9.Ee3Y38HRbcOu_0-j606GwYSMZG2lbeopI-LFq4AUrSc",
        "Accept": "application/json"
      },

    );
    return Future<dynamic>.value(response);
  }else{
    aleart(context, "Your Device not connected to Internet.", false);
    return Future<dynamic>.value(false);
  }
}