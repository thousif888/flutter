import '../repositories/user_repository.dart';
import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';

class DeleteUser implements UseCase<(Failure?, void), String> {
  final UserRepository repository;

  DeleteUser(this.repository);

  @override
  Future<(Failure?, void)> call(String id) async {
    return await repository.deleteUser(id);
  }
}