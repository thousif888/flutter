import '../entities/user.dart';
import '../../core/errors/failures.dart';

abstract class UserRepository {
  Future<(Failure?, User?)> createUser(User user);
  Future<(Failure?, User?)> getUser(String id);
  Future<(Failure?, List<User>?)> getAllUsers();
  Future<(Failure?, User?)> updateUser(User user);
  Future<(Failure?, void)> deleteUser(String id);
}