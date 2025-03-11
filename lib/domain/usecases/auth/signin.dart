import 'package:red/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:red/data/models/auth/signin_user_req.dart';
import 'package:red/domain/repository/auth/auth.dart';
import 'package:red/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}
