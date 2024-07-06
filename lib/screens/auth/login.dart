import 'package:flutter/material.dart';
import 'package:v2/core/feature/color.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SignUpState();
}

class _SignUpState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: false,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  helperText:
                      "Email must contain '@' symbol, and end with gmail.com",
                  helperStyle: TextStyle(color: Colors.green),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!value.contains('@') ||
                      !value.endsWith('gmail.com')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: passwordVisible,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  hintText: "Password",
                  labelText: "Password",
                  helperText: "Password must contain a special character",
                  helperStyle: const TextStyle(color: Colors.green),
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  alignLabelWithHint: false,
                ),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform sign up logic here
                  }
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        text: 'Log In',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: blue,
                                  fontWeight: FontWeight.bold,
                                ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
