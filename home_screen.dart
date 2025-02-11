import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';
import '../../domain/entities/user.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                final user = User(id: '1', name: 'John Doe', email: 'john@example.com');
                final result = await userNotifier.createUser(user);
                if (result.$1 == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User created successfully')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${result.$1!.message}')),
                  );
                }
              },
              child: Text('Create User'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await userNotifier.getUser('1');
                if (result.$1 == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User: ${result.$2!.name}')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${result.$1!.message}')),
                  );
                }
              },
              child: Text('Get User'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await userNotifier.getAllUsers();
                if (result.$1 == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Users: ${result.$2!.length}')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${result.$1!.message}')),
                  );
                }
              },
              child: Text('Get All Users'),
            ),
            ElevatedButton(
              onPressed: () async {
                final user = User(id: '1', name: 'Jane Doe', email: 'jane@example.com');
                final result = await userNotifier.updateUser(user);
                if (result.$1 == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User updated successfully')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${result.$1!.message}')),
                  );
                }
              },
              child: Text('Update User'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await userNotifier.deleteUser('1');
                if (result.$1 == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User deleted successfully')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${result.$1!.message}')),
                  );
                }
              },
              child: Text('Delete User'),
            ),
          ],
        ),
      ),
    );
  }
}