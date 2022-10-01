import 'package:ecommerce_crud_operation/app/modules/product/domain/entities/product_entity.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/entities/user.dart';

class ProfileState {
  final ProfileDataState dataState;

  ProfileState(this.dataState);

  factory ProfileState.initial() {
    return ProfileState(ProfileDataLoadingInProgress());
  }

  ProfileState copyWith({ProfileDataState? dataState}) {
    return ProfileState(
      dataState ?? this.dataState,
    );
  }
}

class ProfileDataState {}

class ProfileDataIdle extends ProfileDataState {}

class ProfileDataLoadingInProgress extends ProfileDataState {}

class ProfileDataLoadingSuccess extends ProfileDataState {
  final Profile user;

  ProfileDataLoadingSuccess({required this.user});
}

class ProfileDataFailure extends ProfileDataState {}
