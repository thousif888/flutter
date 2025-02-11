import '../repositories/user_repository.dart';
import '../entities/user.dart';
import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';

class CreateUser implements UseCase<(Failure?, User?), User> {
  final UserRepository repository;

  CreateUser(this.repository);

  @override
  Future<(Failure?, User?)> call(User user) async {
    return await repository.createUser(user);
  }
}