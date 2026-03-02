import 'package:splitease/features/auth/data/models/auth_user_model.dart';
import 'package:splitease/features/auth/domain/entities/auth_user.dart';

extension AuthUserModelMapper on AuthUserModel {
  AuthUser toDomain() {
    return AuthUser(
      id: id,
      email: email,
    );
  }
}
