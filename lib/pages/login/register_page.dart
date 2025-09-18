import 'package:flutter/material.dart';
import 'package:sziked/helpers/l10n.dart';
import 'package:sziked/helpers/supabase/registration_service.dart';
import 'package:sziked/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

  class _RegisterPageState extends State<RegisterPage> {
    final TextEditingController customIdController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();

  void _handleRegistration() async {
    try {
      // Call the service
      await RegistrationService.registerWithCustomId(
        email: emailController.text,
        password: passwordController.text,
        customId: customIdController.text
      );
      
      // SUCCESS - Handle navigation here in UI layer
      if (mounted) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
      
    } catch (e) {
      // FAILURE - Handle error UI here
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(79),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 16),
              alignment: Alignment.bottomLeft,
              child: Text(
                l10n.szikedAppTitle,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              l10n.createAccount,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.joinSzikedToday,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: customIdController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: l10n.studentId,
                prefixIcon: const Icon(Icons.badge),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: l10n.email,
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: l10n.password,
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: l10n.confirmPassword,
                prefixIcon: const Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle registration logic
                  _handleRegistration();
                },
                child: Text(
                  l10n.register,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  l10n.backToMain,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}