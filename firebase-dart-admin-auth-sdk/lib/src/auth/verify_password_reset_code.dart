
import 'package:firebase_dart_admin_auth_sdk/firebase_dart_admin_auth_sdk.dart';

class VerifyPasswordResetCodeService {
  final FirebaseAuth auth;

  VerifyPasswordResetCodeService({required this.auth});

  Future<Map<String, dynamic>> verifyPasswordResetCode(String code) async {
    try {
      final url = 'resetPassword';
      final body = {
        'oobCode': code,
      };

      return await auth.performRequest(url, body);
    } catch (e) {
      print('Verify password reset code failed: $e');
      throw FirebaseAuthException(
        code: 'verify-password-reset-code-error',
        message: 'Failed to verify password reset code.',
      );
    }
  }
}
