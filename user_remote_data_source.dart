import '../../domain/entities/user.dart';
import '../../core/errors/failures.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class UserRemoteDataSource {
  Future<(Failure?, User?)> createUser(User user);
  Future<(Failure?, User?)> getUser(String id);
  Future<(Failure?, List<User>?)> getAllUsers();
  Future<(Failure?, User?)> updateUser(User user);
  Future<(Failure?, void)> deleteUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl(this.client);

  @override
  Future<(Failure?, User?)> createUser(User user) async {
    // Implement API call to create user
  }

  @override
  Future<(Failure?, User?)> getUser(String id) async {
    // Implement API call to get user
  }

  @override
  Future<(Failure?, List<User>?)> getAllUsers() async {
    // Implement API call to get all users
  }

  @override
  Future<(Failure?, User?)> updateUser(User user) async {
    // Implement API call to update user
  }

  @override
  Future<(Failure?, void)> deleteUser(String id) async {
    // Implement API call to delete user
  }
}