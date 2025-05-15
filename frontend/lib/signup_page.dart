import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF034157), Color(0xFF1AC3C9)],
            stops: [0.01, 0.98],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  'assets/logo_ohvet.png',
                  height: 100,
                ),
                const SizedBox(height: 40),

                _buildSocialButton(
                  color: const Color(0xFF425F9E),
                  icon: 'f',
                  text: 'Sign Up with Facebook',
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
                const SizedBox(height: 24),

                _buildInputField(
                  label: 'Confirm Password',
                  hint: '••••••••••••••',
                  controller: _confirmPasswordController,
                ),
                const SizedBox(height: 12),

                _buildRememberMeSection(),
                const SizedBox(height: 24),

                _buildSignUpButton(),
                const SizedBox(height: 16),

                _buildLoginButton(),
                const SizedBox(height: 24),

                _buildFooterText(),
                const SizedBox(height: 24),
              ],
            ),
          ),
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
        color: Colors.white,
      ),
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
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2.71,
                color: Colors.transparent,
              ),
            ),
          ),
          child: TextField(
            controller: controller,
            obscureText: label.toLowerCase().contains('password'),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.36,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white70),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.transparent,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2.71, color: Color(0xFF1AC3C9)),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(width: 2.71, color: Color(0xFF1AC3C9)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return _buildInputField(
      label: 'Password',
      hint: '••••••••••••••',
      controller: _passwordController,
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
              activeColor: Colors.white,
              checkColor: Colors.black,
            ),
            const Text(
              'Remember me',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forget Password ?',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
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
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _buildSignUpButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            color: Color(0xFF05495E),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF18B4BC), Color(0xFF05495E)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: TextButton(
        onPressed: () => Navigator.pop(context),
        style: TextButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
