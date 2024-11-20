import 'package:travelin/features/auth/domain/entities/app_user.dart';
import 'package:travelin/features/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo{
  @override
  Future<AppUser?> loginWithEmailPassword({String = email, String = password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }
  @override
  Future<AppUser?> regiterWithEmailPassword({String = name, String = email, String = password}) {
    // TODO: implement regiterWithEmailPassword
    throw UnimplementedError();
  }
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  @override
  Future<AppUser?> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}