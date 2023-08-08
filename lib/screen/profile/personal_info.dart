import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/screen/profile/profile_bloc/profile_bloc_cubit.dart';
import 'package:test_task/screen/profile/profile_bloc/profile_bloc_state.dart';
import 'package:test_task/utils/common.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme:const IconThemeData(
          color: Color(0xff36415F)
        ),
        title:const Text('Profile',style: TextStyle(
            fontSize: 18,
            color: Color(0xff36415F)
        )),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if(state.loading){
            return const Center(child: CircularProgressIndicator(
              color: Color(0xff36415F),
            ));
          }
          return Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding:const EdgeInsets.all(10),
                margin:const EdgeInsets.only(left: 10,right: 10,top: 10),
                decoration: BoxDecoration(
                  color:const Color(0xff36415F),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Common.profileText('Address = ${state.profileModel.address}'),
                            const SizedBox(height: 2),
                            Common.profileText('Balance = ${state.profileModel.balance}'),
                            const SizedBox(height: 2),
                            Common.profileText('city = ${state.profileModel.city}'),
                            const SizedBox(height: 2),
                            Common.profileText('currency = ${state.profileModel.currency}'),
                            const SizedBox(height: 2),
                            Common.profileText('currentTradesCount = ${state.profileModel.currentTradesCount}'),
                            const SizedBox(height: 2),
                            Common.profileText('equity = ${state.profileModel.equity}'),
                            const SizedBox(height: 2),
                            Common.profileText('freeMargin = ${state.profileModel.freeMargin}'),
                            const SizedBox(height: 2),
                            Common.profileText('isSwapFree = ${state.profileModel.isSwapFree}'),
                            const SizedBox(height: 2),
                            Common.profileText('isAnyOpenTrades = ${state.profileModel.isAnyOpenTrades}'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Common.profileText('leverage = ${state.profileModel.leverage}'),
                            const SizedBox(height: 2),
                            Common.profileText('name = ${state.profileModel.name}'),
                            const SizedBox(height: 2),
                            Common.profileText('phone = ${state.profileModel.phone}'),
                            const SizedBox(height: 2),
                            Common.profileText('totalTradesCount = ${state.profileModel.totalTradesCount}'),
                            const SizedBox(height: 2),
                            Common.profileText('totalTradesVolume = ${state.profileModel.totalTradesVolume}'),
                            const SizedBox(height: 2),
                            Common.profileText('type = ${state.profileModel.type}'),
                            const SizedBox(height: 2),
                            Common.profileText('verificationLevel = ${state.profileModel.verificationLevel}'),
                            const SizedBox(height: 2),
                            Common.profileText('zipCode = ${state.profileModel.zipCode}'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
