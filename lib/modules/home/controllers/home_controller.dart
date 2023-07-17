import 'package:dartseid/dartseid.dart';
import 'package:dartter/common/context/is_auth_context.dart';
import 'package:dartter/common/hooks/auth_hook.dart';
import 'package:dartter/core/injection.dart';
import 'package:dartter/modules/home/services/home_service.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeController {
  final HomeService _homeService;

  HomeController(this._homeService) {
    Route.get('/').before(getIt<AuthHook>().hook).handle(index);
  }

  Future<String> index(covariant IsAuthContext context) {
    return _homeService.index();
  }
}
