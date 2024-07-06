import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _HomePageState();
}

class _HomePageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Account')),
    );
  }
}
