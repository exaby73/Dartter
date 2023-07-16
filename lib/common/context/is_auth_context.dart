import 'package:dartseid/dartseid.dart';

class IsAuthContext extends RequestContext {
  final int userId;

  IsAuthContext(
      {required super.route, required super.request, required this.userId,});
}
