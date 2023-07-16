import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
class Env {
@EnviedField(varName: 'JWT_SECRET')
static const String jwtSecret = _Env.jwtSecret;
}
