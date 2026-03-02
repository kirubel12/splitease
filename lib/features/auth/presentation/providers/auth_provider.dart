import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:splitease/features/auth/data/repositories/supabase_auth_repository.dart';
import 'package:splitease/features/auth/domain/entities/auth_state.dart';
import 'package:splitease/features/auth/domain/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return const SupabaseAuthRepository();
}

@riverpod
class AuthController extends _$AuthController {
  @override
  Future<AuthState> build() async {
    final repository = ref.watch(authRepositoryProvider);
    final currentUser = repository.currentUser();
    if (currentUser == null) {
      return const AuthState.unauthenticated();
    }
    return AuthState.authenticated(currentUser);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final repository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final result = await repository.loginWithEmailPassword(
        email: email,
        password: password,
      );

      if (!result.hasSession) {
        return const AuthState.unauthenticated();
      }

      return AuthState.authenticated(result.user);
    });
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    final repository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();

    try {
      final result = await repository.signUpWithEmailPassword(
        username: username,
        email: email,
        password: password,
      );

      if (result.hasSession) {
        await repository.logout();
      }

      state = const AsyncData(AuthState.unauthenticated());
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }

  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.logout();
    state = const AsyncData(AuthState.unauthenticated());
  }
}
