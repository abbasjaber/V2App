import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'data:image/jpeg;base64,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'),
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
        ElevatedButton(
          onPressed: () {
            // Add your edit logic here
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Edit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
    );
  }
}
