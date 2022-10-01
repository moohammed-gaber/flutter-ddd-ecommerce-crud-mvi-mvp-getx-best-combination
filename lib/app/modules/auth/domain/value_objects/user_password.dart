import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/value_object.dart';

class UserPassword extends ValueObject<String> {
  static Either<ValueFailure<String>, String> validate(String input) {
    if (input.length >= 6) {
      return right(input);
    } else {
      return left(ValueFailure());
    }
  }

  @override
  final Either<ValueFailure<String>, String> value;

  factory UserPassword(String input) {
    return UserPassword._(
      validate(input),
    );
  }

  const UserPassword._(this.value);
}
