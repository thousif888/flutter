import '../repositories/user_repository.dart';
import '../../core/usecases/usecase.dart';
import '../../core/errors/failures.dart';
import '../entities/user.dart';

class GetUser implements UseCase<(Failure?, User?), String> {
  final UserRepository repository;

  GetUser(this.repository);

  @override
  Future<(Failure?, User?)> call(String id) async {
    return await repository.getUser(id);
  }
}