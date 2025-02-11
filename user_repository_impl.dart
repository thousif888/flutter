import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user.dart';
import '../../core/errors/failures.dart';
import '../datasources/user_remote_data_source.dart';
import '../../core/network/network_info.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<(Failure?, User?)> createUser(User user) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.createUser(user);
    } else {
      return (ServerFailure('No Internet Connection'), null);
    }
  }

  @override
  Future<(Failure?, User?)> getUser(String id) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.getUser(id);
    } else {
      return (ServerFailure('No Internet Connection'), null);
    }
  }

  @override
  Future<(Failure?, List<User>?)> getAllUsers() async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.getAllUsers();
    } else {
      return (ServerFailure('No Internet Connection'), null);
    }
  }

  @override
  Future<(Failure?, User?)> updateUser(User user) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.updateUser(user);
    } else {
      return (ServerFailure('No Internet Connection'), null);
    }
  }

  @override
  Future<(Failure?, void)> deleteUser(String id) async {
    if (await networkInfo.isConnected) {
      return await remoteDataSource.deleteUser(id);
    } else {
      return (ServerFailure('No Internet Connection'), null);
    }
  }
}