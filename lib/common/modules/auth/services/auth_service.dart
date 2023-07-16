import 'package:dartseid_views/dartseid_views.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthService {
  Future<String> index() async {
    return view('auth', {'title': 'Login or Register!!!'});
  }
}
