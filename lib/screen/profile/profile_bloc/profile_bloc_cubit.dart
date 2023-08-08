import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/model/profile_model.dart';
import 'package:test_task/screen/profile/profile_bloc/profile_bloc_state.dart';
import 'package:test_task/utils/common.dart';
import '../../../service/api_service.dart';

class ProfileBloc extends Cubit<ProfileState>{
  ApiService apiService;


  ProfileBloc(this.apiService): super(
      ProfileState(
            loading: false,
            isSuccess: false,
            profileModel: ProfileModel(),
            errorMessage: '',
            isFailed: false)){
profileData(Common.scaffoldKey.currentContext!);
  }

  profileData(BuildContext context) async {
    emit(state.copyWith(loading: true));

    apiService.getLastPhoneNumber(context).then((value) {
      emit(state.copyWith(loading: false));
      emit(state.copyWith(profileModel: value));

      emit(state.copyWith(isFailed: false));
    }, onError: (error) {
      emit(state.copyWith(loading: false));
      emit(state.copyWith(isFailed: true));
    });
  }

}
