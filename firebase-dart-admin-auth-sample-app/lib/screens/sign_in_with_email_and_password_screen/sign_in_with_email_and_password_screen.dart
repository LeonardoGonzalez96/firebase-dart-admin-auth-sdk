import 'package:dart_admin_auth_sample_app/screens/home_screen/home_screen.dart';
import 'package:dart_admin_auth_sample_app/shared/shared.dart';
import 'package:dart_admin_auth_sample_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'sign_in_with_email_and_password_view_model.dart';

class SignInWithEmailAndPasswordScreen extends StatefulWidget {
  const SignInWithEmailAndPasswordScreen({super.key});

  @override
  State<SignInWithEmailAndPasswordScreen> createState() =>
      _SignInWithEmailAndPasswordScreenState();
}

class _SignInWithEmailAndPasswordScreenState
    extends State<SignInWithEmailAndPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInWithEmailAndPasswordViewModel(),
      child: Consumer<SignInWithEmailAndPasswordViewModel>(
        builder: (context, value, child) => Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A0DAD), Color(0xFF4B0082)], // Purple gradient
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputField(
                    controller: _emailController,
                    hint: 'test@gmail.com',
                    label: 'Email',
                  ),
                  20.vSpace,
                  InputField(
                    controller: _passwordController,
                    hint: '******',
                    label: 'Password',
                    obscure: true,
                  ),
                  20.vSpace,
                  Button(
                    onTap: () {
                      value.signIn(
                        _emailController.text,
                        _passwordController.text,
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        ),
                      );
                    },
                    title: 'Sign In',
                  ),
                  20.vSpace,
                  GestureDetector(
                    onTap: () => showSignMethodsBottomSheet(context),
                    child: const Text(
                      'Explore more sign in options',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellowAccent,
                      ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}