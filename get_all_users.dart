import '../repositories/user_repository.dart';
import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';
import '../entities/user.dart';

class GetAllUsers implements UseCase<(Failure?, List<User>?), NoParams> {
  final UserRepository repository;

  GetAllUsers(this.repository);

  @override
  Future<(Failure?, List<User>?)> call(NoParams params) async {
    return await repository.getAllUsers();
  }
}