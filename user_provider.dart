import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/create_user.dart';
import '../../domain/usecases/get_user.dart';
import '../../domain/usecases/get_all_users.dart';
import '../../domain/usecases/update_user.dart';
import '../../domain/usecases/delete_user.dart';
import '../../domain/entities/user.dart';
import '../../core/errors/failures.dart';

final userProvider = Provider((ref) {
  return UserNotifier(
    createUser: ref.watch(createUserProvider),
    getUser: ref.watch(getUserProvider),
    getAllUsers: ref.watch(getAllUsersProvider),
    updateUser: ref.watch(updateUserProvider),
    deleteUser: ref.watch(deleteUserProvider),
  );
});

class UserNotifier {
  final CreateUser createUser;
  final GetUser getUser;
  final GetAllUsers getAllUsers;
  final UpdateUser updateUser;
  final DeleteUser deleteUser;

  UserNotifier({
    required this.createUser,
    required this.getUser,
    required this.getAllUsers,
    required this.updateUser,
    required this.deleteUser,
  });

  Future<(Failure?, User?)> createUser(User user) async {
    return await createUser(user);
  }

  Future<(Failure?, User?)> getUser(String id) async {
    return await getUser(id);
  }

  Future<(Failure?, List<User>?)> getAllUsers() async {
    return await getAllUsers(NoParams());
  }

  Future<(Failure?, User?)> updateUser(User user) async {
    return await updateUser(user);
  }

  Future<(Failure?, void)> deleteUser(String id) async {
    return await deleteUser(id);
  }
}