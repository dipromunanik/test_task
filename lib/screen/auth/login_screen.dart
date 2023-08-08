import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/screen/welcome/start_page.dart';

import '../../common_widgets/custom_button.dart';
import '../../common_widgets/custom_password_field_widget.dart';
import '../../common_widgets/custom_text_field_widget.dart';
import '../../utils/common.dart';
import 'bloc/login_bloc_cubit.dart';
import 'bloc/login_bloc_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Common.fieldTitle18("Email"),
              CustomTextField(
                  hintText: 'Enter user',
                  iconData: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.email,
                      )),
                  controller: LoginBloc.userController,
                  isObscure: false,
                  onChanged: (val) {}),
              const SizedBox(height: 30),
              Common.fieldTitle18("Password"),
              CustomPasswordField(
                  hintText: 'Enter password',
                  controller: LoginBloc.passwordController,
                  onChanged: (val) {
                    // context.read<LoginBloc>().checkValidate();
                  }),
              const SizedBox(height: 35),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.isSuccess == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StartPage()));
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    btnText: 'Login',
                    color: const Color(0xff36415F),
                    textColor: Colors.white,
                    isLoading: state.loading,
                    onTap: () {
                      context.read<LoginBloc>().login();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
