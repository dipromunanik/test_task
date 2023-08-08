import 'package:flutter/material.dart';

import '../utils/const.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final VoidCallback? onTap;
  Color color,textColor,progressColor;
  bool isLoading;
  CustomButton({Key? key, required this.btnText, this.onTap, required this.color,required this.textColor, this.progressColor=Colors.black, this.isLoading=false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            elevation: 0,
            minimumSize: Size(screenWidth(context), 45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ),
        onPressed: onTap,
        child:isLoading?SizedBox(height: 25,width: 25,child: CircularProgressIndicator(color: progressColor)): Text(btnText,

        )
    );
  }
}
