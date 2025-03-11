import 'package:red/core/usecase/usecase.dart';
import 'package:red/data/models/auth/create_user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:red/domain/repository/auth/auth.dart';
import 'package:red/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signUp(params!);
  }
}
