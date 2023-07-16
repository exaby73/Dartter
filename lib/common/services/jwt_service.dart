import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dartseid/dartseid.dart';
import 'package:dartter/core/env.dart';
import 'package:injectable/injectable.dart';

typedef JwtPayload = ({int id});

extension on JwtPayload {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}

@singleton
class JwtService {
  String generate(JwtPayload payload) {
    final json = payload.toJson();
    final token = JWT(json);
    return token.sign(SecretKey(Env.jwtSecret));
  }

  JwtPayload verify(String token) {
    try {
      final jwt = JWT.verify(token, SecretKey(Env.jwtSecret));
      final json = jwt.payload as Map;
      return (id: json['id'] as int);
    } catch (e) {
      throw const UnauthorizedException(message: 'Invalid token');
    }
  }
}
