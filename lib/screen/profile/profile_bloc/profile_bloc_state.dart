

import 'package:equatable/equatable.dart';
import 'package:test_task/model/profile_model.dart';

class ProfileState extends Equatable{

  final bool loading;
  final bool isSuccess;
  final bool isFailed;
  final ProfileModel profileModel;
  final String errorMessage;

  const ProfileState(
      {required this.loading,
        required this.isSuccess,
        required this.profileModel,
        required this.errorMessage,
        required this.isFailed});

  ProfileState copyWith({
    bool? loading,
    bool? isSuccess,
    bool? isFailed,
    ProfileModel? profileModel,
    String? errorMessage,
  }) {
    return ProfileState(
      loading: loading ?? this.loading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailed: isFailed ?? this.isFailed,
      profileModel:
      profileModel ?? this.profileModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [loading, isSuccess, isFailed, errorMessage,profileModel];
}