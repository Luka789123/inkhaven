import 'package:inkhaven/core/entity/core_entity/response.dart';
part 'server_failure.dart';
part 'network_failure.dart';
part 'auth_failure.dart';

sealed class Failure extends Response {}
