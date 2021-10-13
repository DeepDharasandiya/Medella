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
Future<dynamic> updatedetails(BuildContext context,String name,Object body) async {
  if(await networkcheck(context)==true) {
    var url = Uri.parse(domain+name);
    final response = await http.patch(url,
        body: body
    );
    return Future<dynamic>.value(response);
  }else{
    aleart(context, "Your Device not connected to Internet.", false);
    return Future<dynamic>.value(false);
  }
}
/*Future<http.Response> api(BuildContext context,String name,String token,Object body) {
  return http.post(
    Uri.parse(domain+name),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      "authorization ":token,
    },
    body: body,
  );
}*/
/*Future<dynamic> getauth(BuildContext context,String name,String token,Object body) async {
  if(await networkcheck(context)==true) {
    var url = Uri.parse("https://www.universal-tutorial.com/api/getaccesstoken");
    final response = await http.get(url,
        headers: {
            "Accept": "application/json",
            "api-token": "ETOBgjTje6aR4evZqH863kRmCEL-UMCjUYF5B2nUumrlLoKuxUkIjiMAFzB1C11k6EI",
            "user-email": "dharsandiyadeep1234@gmail.com"
        },

    );
    return Future<dynamic>.value(response);
  }else{
    aleart(context, "Your Device not connected to Internet.", false);
    return Future<dynamic>.value(false);
  }
}*/
Future<dynamic> getstate(BuildContext context,String name) async {
  if(await networkcheck(context)==true) {
    var url = Uri.parse("https://www.universal-tutorial.com/api/states/"+name);
    final response = await http.get(url,
      headers: {
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJkaGFyc2FuZGl5YWRlZXAxMjM0QGdtYWlsLmNvbSIsImFwaV90b2tlbiI6IkVUT0JnalRqZTZhUjRldlpxSDg2M2tSbUNFTC1VTUNqVVlGNUIyblV1bXJsTG9LdXhVa0lqaU1BRnpCMUMxMWs2RUkifSwiZXhwIjoxNjM0MDk5NzU2fQ.ZS29vOH_6uilrpeI3CSSijxVrwK0SneHQ_5tWV10Evo",
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
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJkaGFyc2FuZGl5YWRlZXAxMjM0QGdtYWlsLmNvbSIsImFwaV90b2tlbiI6IkVUT0JnalRqZTZhUjRldlpxSDg2M2tSbUNFTC1VTUNqVVlGNUIyblV1bXJsTG9LdXhVa0lqaU1BRnpCMUMxMWs2RUkifSwiZXhwIjoxNjM0MDk5NzU2fQ.ZS29vOH_6uilrpeI3CSSijxVrwK0SneHQ_5tWV10Evo",
        "Accept": "application/json"
      },

    );
    return Future<dynamic>.value(response);
  }else{
    aleart(context, "Your Device not connected to Internet.", false);
    return Future<dynamic>.value(false);
  }
}