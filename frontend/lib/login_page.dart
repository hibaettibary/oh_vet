import 'package:flutter/material.dart';
import 'signup_page.dart'; // Import ajouté

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            Image.asset(
              'assets/logo.png',
              height: 100,
            ),
            const SizedBox(height: 40),

            _buildSocialButton(
              color: const Color(0xFF425F9E),
              icon: 'f',
              text: 'Continuer avec Facebook',
              isFacebook: true,
            ),
            const SizedBox(height: 16),

            _buildSocialButton(
              color: Colors.white,
              icon: 'assets/google_icon.png',
              text: 'Continuer avec Google',
              textColor: const Color(0xFF4285F4),
            ),
            const SizedBox(height: 24),

            _buildSeparator(),
            const SizedBox(height: 24),

            _buildInputField(
              label: 'Email Address',
              hint: 'contact@ohvet.ma',
              controller: _emailController,
            ),
            const SizedBox(height: 24),

            _buildPasswordField(),
            const SizedBox(height: 12),

            _buildRememberMeSection(),
            const SizedBox(height: 13.75),

            _buildGradientButton(),
            const SizedBox(height: 16),

            _buildSignUpButton(),
            const SizedBox(height: 24),

            _buildFooterText(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required Color color,
    required String icon,
    required String text,
    Color textColor = Colors.white,
    bool isFacebook = false,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
        border: isFacebook ? null : Border.all(color: Colors.grey),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFacebook
                ? Text(
                    'f',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Image.asset(icon, width: 24, height: 24),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator() {
  return const Text(
    '- OR -',
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13.57,
    ),
    textAlign: TextAlign.center,
  );
}

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF797876),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Stack(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.36,
              ),
              decoration: const InputDecoration(
                hintText: 'contact@ohvet.ma',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF034157), Color(0xFF1AC3C9)],
                    stops: [0.01, 0.98],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            color: Color(0xFF797876),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Stack(
          children: [
            TextField( // Correction : retrait du const
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: '••••••••••••••',
                border: InputBorder.none,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 2,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF034157), Color(0xFF1AC3C9)],
                    stops: [0.01, 0.98],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRememberMeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberMe,
              onChanged: (value) => setState(() => rememberMe = value!),
              activeColor: const Color(0xFF05485D),
            ),
            const Text(
              'Remember me',
              style: TextStyle(color: Color(0xFF000000)),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forget Password ?',
            style: TextStyle(color: Color(0xFF05485D)),
          ),
        ),
      ],
    );
  }

  Widget _buildGradientButton() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF034157), Color(0xFF1AC3C9)],
          stops: [0.01, 0.98],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email == 'admin@ohvet.ma' && password == '123456') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Connexion réussie !')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Identifiants incorrects')),
      );
    }
  }

  Widget _buildSignUpButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: const BorderSide(color: Colors.transparent),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUpPage()),
          );
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(color: Color(0xFF000000)),
        ),
      ),
    );
  }

  Widget _buildFooterText() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'By Signing up, you agree to Oh! vet’s\n'),
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(color: Color(0xFF2E86AB)),
          ),
          TextSpan(text: ' & '),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(color: Color(0xFF2E86AB)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}