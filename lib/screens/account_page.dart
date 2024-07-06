import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:v2/widgets/gradient_button.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            child:
                Image.network('https://www.w3schools.com/w3images/avatar5.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Bala Bala',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'ABCD@gmail.com',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '1234567890',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          GradientButton(
            title: 'Edit',
            onButtonPressed: () {
              context.push('/edit_profile');
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Additional Staffs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('John Doe'),
            subtitle: Text('john.doe@example.com'),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('Jane Smith'),
            subtitle: Text('jane.smith@example.com'),
          ),
        ],
      ),
    );
  }
}
