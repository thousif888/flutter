import '../repositories/user_repository.dart';
import '../entities/user.dart';
import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';

class UpdateUser implements UseCase<(Failure?, User?), User> {
  final UserRepository repository;

  UpdateUser(this.repository);

  @override
  Future<(Failure?, User?)> call(User user) async {
    return await repository.updateUser(user);
  }
}