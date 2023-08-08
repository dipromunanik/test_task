import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TOKEN = "TOKEN";
const EMAIL = "EMAIL";
const PASSWORD = "PASSWORD";

final key = GlobalKey();

var requestData = '''
<wsdl:definitions xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:wsx="http://schemas.xmlsoap.org/ws/2004/09/mex" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" xmlns:wsa10="http://www.w3.org/2005/08/addressing" xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy" xmlns:wsap="http://schemas.xmlsoap.org/ws/2004/08/addressing/policy" xmlns:msc="http://schemas.microsoft.com/ws/2005/12/wsdl/contract" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:wsa="http://schemas.xmlsoap.org/ws/2004/08/addressing" xmlns:wsam="http://www.w3.org/2007/05/addressing/metadata" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:tns="http://tempuri.org/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:wsaw="http://www.w3.org/2006/05/addressing/wsdl" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" name="Service1" targetNamespace="http://tempuri.org/">
...
</wsdl:definitions>

''';


saveString(String keyword, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(keyword, value);
}
clearPrefsData() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.clear();
}


getStringPrefs(String keyword) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString(keyword) ?? "";
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

