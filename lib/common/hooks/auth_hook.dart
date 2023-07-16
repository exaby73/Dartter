import 'dart:io';

import 'package:dartseid/dartseid.dart';
import 'package:dartter/common/context/is_auth_context.dart';
import 'package:dartter/common/services/jwt_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthHook {
  final JwtService _jwtService;

  AuthHook(this._jwtService);

  IsAuthContext hook(RequestContext context) {
    final cookie = context.rawRequest.cookies.firstWhere(
      (cookie) => cookie.name == 'token',
      orElse: () {
        context.responseHeaders.add('Location', '/auth');
        throw const DartseidHttpException(
            'No token found!', HttpStatus.temporaryRedirect,);
      },
    );

    final payload = _jwtService.verify(cookie.value);
    return IsAuthContext(
      request: context.rawRequest,
      route: context.route,
      userId: payload.id,
    );
  }
}
