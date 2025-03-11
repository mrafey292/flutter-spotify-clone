import 'package:dartz/dartz.dart';
import 'package:red/data/models/auth/create_user_req.dart';
import 'package:red/data/models/auth/signin_user_req.dart';
import 'package:red/data/sources/auth/auth_firebase_service.dart';
import 'package:red/domain/repository/auth/auth.dart';
import 'package:red/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIn(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signinUserReq);
  }

  @override
  Future<Either> signUp(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
