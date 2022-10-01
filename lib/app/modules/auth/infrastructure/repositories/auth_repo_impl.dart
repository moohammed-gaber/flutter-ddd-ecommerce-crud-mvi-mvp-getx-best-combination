import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/failures/exception.dart';
import 'package:ecommerce_crud_operation/app/core/failures/failure.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/entities/user.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/failures/failures.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_email.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_full_name.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_password.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_token.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/data_sources/auth_local_data_source.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/data_sources/auth_remote_data_source.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/exceptions/exceptions.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  final AuthLocalDataSource localDataSource;

  AuthRepoImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, LoggedUser>> login(
      UserEmail email, UserPassword password) async {
    final passwordValue = password.getOrCrash();
    final emailValue = email.getOrCrash();
    try {
      final result = await remoteDataSource.login(emailValue, passwordValue);
      await localDataSource.saveToken(result.token);
      return right(result.toDomain());
    } on InvalidEmailOrPasswordException {
      return left(InvalidEmailOrPasswordFailure());
    } on ServerException {
      return left(ServerFailure());
    } catch (e) {
      return left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> register(
      UserFullName name, UserPassword password, UserEmail email) async {
    try {
      final passwordValue = password.getOrCrash();
      final nameValue = name.getOrCrash();
      final emailValue = email.getOrCrash();

      await remoteDataSource.register(nameValue, emailValue, passwordValue);
      return right(unit);
    } on EmailAlreadyExistsException {
      return left(EmailAlreadyExistsFailure());
    } on ServerException {
      return left(ServerFailure());
    } catch (e) {
      rethrow;
      return left(UnExpectedFailure());
    }
  }

  @override
  Future<Either<Failure, Profile>> getMyProfile() async {
    try {
      final result = await remoteDataSource.getProfile();
      return right(result.toDomain());
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  UserToken? getSavedToken() {
    final token = localDataSource.getToken();
    return token == null ? null : UserToken(token);
  }
}