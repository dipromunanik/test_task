import 'package:flutter/material.dart';
import 'package:test_task/screen/auth/login_screen.dart';
import 'package:test_task/screen/profile/personal_info.dart';
import 'package:test_task/utils/const.dart';

import '../../common_widgets/custom_button.dart';
import '../trade/trade.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title:const Text('Select Information',style: TextStyle(
            fontSize: 18,
            color: Color(0xff36415F)
        )),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async{
          await clearPrefsData();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
        },
        child: Container(
          height: 50,
          decoration:const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            )
          ),
          child:const Center(
            child: Text('Logout',style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              btnText: 'Profile Information',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PersonalInfo()));
              },
              color:const Color(0xff36415F),
              textColor: Colors.white,
            ),
            const SizedBox(height: 15),
            CustomButton(
              btnText: 'Trade Information',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const TradePage()));
              },
              color:const Color(0xff36415F),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
