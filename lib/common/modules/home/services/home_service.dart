import 'package:dartseid_views/dartseid_views.dart';
import 'package:injectable/injectable.dart';

@singleton
class HomeService {
  Future<String> index() async {
    return view('index');
  }
}
