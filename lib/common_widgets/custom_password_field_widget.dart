import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {

  final String? hintText;
  final TextEditingController? controller;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;

  const CustomPasswordField({Key? key, this.hintText ,this.controller,required this.onChanged,this.validator}) : super(key: key);

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {

  var obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscure,
      validator: widget.validator,
      onChanged: widget.onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration:  InputDecoration(
        contentPadding:const EdgeInsets.symmetric(horizontal: 0,vertical: 12),
        border:const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff3DD6FF),
                width: 1
            )
        ),
        enabledBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff3DD6FF),
              width: 1
            )
        ),
        focusedBorder:const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff3DD6FF),
                width: 1
            )
        ),
        hintText: widget.hintText,
          hintStyle:const TextStyle(
              fontSize: 12
          ),
        isDense: true,
         suffixIcon: IconButton(onPressed: (){
           setState(() {
             obscure = !obscure;
           });
         }, icon: Icon( obscure ?Icons.visibility_off: Icons.visibility) ),
        suffixIconColor:const Color(0xff3DD6FF),
        suffixIconConstraints:const BoxConstraints(
          minHeight: 30,
        )
      ),
    );
  }
}
