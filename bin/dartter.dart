import 'package:dartseid/dartseid.dart';
import 'package:dartter/core/injection.dart';

Future<void> main() async {
  return runServer(
    port: 3000,
    init: configureDependencies,
  );
}
