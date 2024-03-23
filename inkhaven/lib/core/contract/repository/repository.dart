import '../../util/authentication_manager.dart';
import '../data_source/data_source.dart';

abstract class Repository {
  final DataSource _dataSource;
  final AuthenticationManager _authUseCase;
  final NetworkInfo _networkInfo;
  Repository({required DataSource dataSource, required AuthUseCae})
      : _dataSource = dataSource;
}
