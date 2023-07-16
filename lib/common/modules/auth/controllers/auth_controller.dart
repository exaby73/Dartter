import 'package:dartseid/dartseid.dart';
import 'package:dartter/common/modules/auth/services/auth_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthController {
  final AuthService _authService;

  AuthController(this._authService) {
    Route.get('/auth').handle(index);
  }

  Future<String> index(RequestContext context) async {
    return _authService.index();
  }
}
