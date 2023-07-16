import 'package:dargon2/dargon2.dart';
import 'package:injectable/injectable.dart';

@singleton
class HashService {
  Future<String> hash(String password) async {
    return argon2
        .hashPasswordString(password, salt: Salt.newSalt())
        .then((r) => r.hexString);
  }

  Future<bool> verify(String password, String hash) async {
    return argon2.verifyHashString(password, hash);
  }
}
