import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_task/model/profile_model.dart';
import 'package:test_task/model/trade_model.dart';
import 'package:test_task/screen/auth/login_screen.dart';
import 'package:test_task/screen/welcome/start_page.dart';
import '../utils/const.dart';

class ApiService {
  static const String loginUrl =
      'https://peanut.ifxdb.com/api/ClientCabinetBasic/IsAccountCredentialsCorrect';
  static const String accountSettingUrl =
      'https://peanut.ifxdb.com/api/ClientCabinetBasic/GetLastFourNumbersPhone';
  static const String accountLastPhoneNumberUrl =
      'https://peanut.ifxdb.com/api/ClientCabinetBasic/GetAccountInformation';
  static const String tradeUrl =
      'https://peanut.ifxdb.com/api/ClientCabinetBasic/GetOpenTrades';

  //user login
  Future<String> loginUser(String email, String password) async {
    var body = {
      "login": email,
      "password": password,
    };
    log('login boooo${body}');
    var header = {"Content-Type": "application/json", "Accept": "*/*"};

    try {
      var response = await http.post(Uri.parse(loginUrl),
          body: jsonEncode(body), headers: header);

      log('login body ===${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        await saveString(TOKEN, data['token']);

        log('token of the ${data['token']}');
        await saveString(EMAIL, email);
        await saveString(PASSWORD, password);

        return "success";
      } else if (response.statusCode == 404) {
        return "Invalid Email, Please try again";
      } else if (response.statusCode == 500) {
        return "You could not login now";
      } else {
        return "Login failed";
      }
    } on SocketException {
      return "Sorry you are not connected with internet";
    } on TimeoutException {
      return "Sorry timeout please try again";
    }
  }

  Future<String> checkUserIsAuthenticate(
      String email, String password, String token, BuildContext context) async {
    var body = {
      "login": email,
      "password": password,
    };
    log('login boooo${body}');
    var header = {"Content-Type": "application/json", "Accept": "*/*"};

    try {
      var response = await http.post(Uri.parse(loginUrl),
          body: jsonEncode(body), headers: header);

      log('login body ===${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        var serverToken = data['token'];

        if (serverToken == token) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StartPage()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }

        return "success";
      } else if (response.statusCode == 404) {
        return "Invalid Email, Please try again";
      } else if (response.statusCode == 500) {
        return "You could not login now";
      } else {
        return "Login failed";
      }
    } on SocketException {
      return "Sorry you are not connected with internet";
    } on TimeoutException {
      return "Sorry timeout please try again";
    }
  }

  Future<String> getAccountSetting() async {
    var token = await getStringPrefs(TOKEN);
    var email = await getStringPrefs(EMAIL);

    var body = {
      "login": email,
      "token": token,
    };
    log('login boooo${body}');
    var header = {"Content-Type": "application/json", "Accept": "*/*"};

    try {
      var response = await http.post(Uri.parse(accountSettingUrl),
          body: jsonEncode(body), headers: header);

      log('login body ===${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        log('data is ${data}');

        return "success";
      } else if (response.statusCode == 404) {
        return "Invalid Email, Please try again";
      } else if (response.statusCode == 500) {
        return "You could not login now";
      } else {
        return "Login failed";
      }
    } on SocketException {
      return "Sorry you are not connected with internet";
    } on TimeoutException {
      return "Sorry timeout please try again";
    }
  }

  Future<ProfileModel> getLastPhoneNumber(BuildContext context) async {
    var token = await getStringPrefs(TOKEN);
    var email = await getStringPrefs(EMAIL);

    var body = {
      "login": email,
      "token": token,
    };
    log('login boooo${body}');
    var header = {"Content-Type": "application/json", "Accept": "*/*"};

    try {
      var response = await http.post(Uri.parse(accountLastPhoneNumberUrl),
          body: jsonEncode(body), headers: header);

      log('login body ===${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        log('data is ${data}');

        return ProfileModel.fromJson(data);
      } else if (response.statusCode == 401) {
        await clearPrefsData();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);

        throw Exception('');
      } else if (response.statusCode == 404) {
        throw Exception('');
      } else if (response.statusCode == 500) {
        throw Exception('');
      } else {
        throw Exception('');
      }
    } on SocketException {
      throw Exception('');
    } on TimeoutException {
      throw Exception('');
    }
  }

  Future<List<TradeModel>> getTrade(BuildContext context) async {
    var token = await getStringPrefs(TOKEN);
    var email = await getStringPrefs(EMAIL);

    var body = {
      "login": email,
      "token": token,
    };
    log('login boooo${body}');
    var header = {"Content-Type": "application/json", "Accept": "*/*"};

    try {
      var response = await http.post(Uri.parse(tradeUrl),
          body: jsonEncode(body), headers: header);

      log('login body ===${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        log('data is ${data}');

        return data.map((e) => TradeModel.fromJson(e)).toList();
      } else if (response.statusCode == 401) {
        await clearPrefsData();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);

        throw Exception('');
      } else if (response.statusCode == 404) {
        throw Exception('');
      } else if (response.statusCode == 500) {
        throw Exception('');
      } else {
        throw Exception('');
      }
    } on SocketException {
      throw Exception('');
    } on TimeoutException {
      throw Exception('');
    }
  }

  Future<List<TradeModel>> getRequest(BuildContext context) async {
    var token = await getStringPrefs(TOKEN);
    var email = await getStringPrefs(EMAIL);

    var body = {
      "login": email,
      "token": token,
    };
    log('login boooo${body}');
    var header = {"Content-Type": "application/json", "Accept": "*/*"};

    try {
      var response = await http.post(Uri.parse(tradeUrl),
          body: jsonEncode(body), headers: header);

      log('login body ===${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        log('data is $data');

        return data.map((e) => TradeModel.fromJson(e)).toList();
      } else if (response.statusCode == 401) {
        await clearPrefsData();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);

        throw Exception('');
      } else if (response.statusCode == 404) {
        throw Exception('');
      } else if (response.statusCode == 500) {
        throw Exception('');
      } else {
        throw Exception('');
      }
    } on SocketException {
      throw Exception('');
    } on TimeoutException {
      throw Exception('');
    }
  }
}
