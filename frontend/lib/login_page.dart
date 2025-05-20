import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'Conditions.dart'; // Assurez-vous que ce fichier existe

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

  final double _buttonRadius = 3.39; // Define the desired radius here

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double uniformButtonHeight = screenHeight * 0.055;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Image.asset(
              'assets/logo.png',
              height: screenHeight * 0.08,
              semanticLabel: 'Oh! Vet Logo', // Added semanticLabel
            ),
            SizedBox(height: screenHeight * 0.04),
            _buildSocialButton(
              color: const Color(0xFF425F9E),
              icon: 'f',
              text: 'Sign Up with Facebook',
              isFacebook: true,
              iconFontSize: 18,
              buttonFontSize: 15,
              buttonFontWeight: FontWeight.bold,
              buttonHeight: uniformButtonHeight,
            ),
            const SizedBox(height: 13),
            _buildSocialButton(
              color: Colors.white,
              icon: 'assets/google_icon.png',
              text: 'Continue with Google',
              textColor: const Color(0xFF4285F4),
              buttonFontSize: 15,
              buttonFontWeight: FontWeight.bold,
              buttonHeight: uniformButtonHeight,
            ),
            const SizedBox(height: 15),
            _buildSeparator(),
            const SizedBox(height: 15),
            _buildInputField(
              label: 'Email Address',
              hint: 'contact@ohvet.ma',
              controller: _emailController,
            ),
            const SizedBox(height: 12),
            _buildPasswordField(),
            const SizedBox(height: 10),
            _buildRememberMeSection(fontSize: 13.57),
            const SizedBox(height: 14),
            _buildGradientButton(
              buttonText: 'Login',
              buttonFontSize: 15,
              buttonFontWeight: FontWeight.bold,
              buttonHeight: uniformButtonHeight,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConditionsPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 13),
            _buildSignUpButton(
              buttonText: 'Sign Up',
              buttonFontSize: 15,
              buttonFontWeight: FontWeight.bold,
              buttonHeight: uniformButtonHeight,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildFooterText(),
            SizedBox(height: screenHeight * 0.02),
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
    double iconFontSize = 24,
    required double buttonFontSize,
    required FontWeight buttonFontWeight,
    required double buttonHeight,
  }) {
    return Container(
      width: double.infinity,
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          _buttonRadius,
        ), // Applied radius here
        color: color,
        border: isFacebook ? null : Border.all(color: Colors.grey),
      ),
      child: TextButton(
        onPressed: () {
          print(
            isFacebook ? 'Connexion avec Facebook' : 'Connexion avec Google',
          );
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_buttonRadius),
          ), // Applied radius here
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFacebook
                ? Text(
                  icon,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: iconFontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'circulard std',
                  ),
                )
                : Image.asset(icon, width: 22, height: 22),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: buttonFontSize,
                fontWeight: buttonFontWeight,
                fontFamily: 'circulard std',
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
        fontSize: 13,
        fontFamily: 'circulard std',
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
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'circulard std',
          ),
        ),
        const SizedBox(height: 2),
        Stack(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'circulard std',
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontFamily: 'circulard std',
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
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
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'circulard std',
          ),
        ),
        const SizedBox(height: 3),
        Stack(
          children: [
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontFamily: 'circulard std',
              ),
              decoration: const InputDecoration(
                hintText: '••••••••••••••',
                hintStyle: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontFamily: 'circulard std',
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
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

  Widget _buildRememberMeSection({required double fontSize}) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween, // This handles the space between "Remember me" group and "Forget Password?"
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.8,
              child: Checkbox(
                value: rememberMe,
                onChanged: (value) => setState(() => rememberMe = value!),
                activeColor: const Color(0xFF05485D),
                materialTapTargetSize:
                    MaterialTapTargetSize
                        .shrinkWrap, // Makes the checkbox area smaller
              ),
            ),
            // Removed SizedBox here to make the checkbox and text directly adjacent
            Text(
              'Remember me',
              style: TextStyle(
                color: const Color(0xFF000000),
                fontSize: fontSize,
                fontFamily: 'circulard std',
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            print('Mot de passe oublié cliqué');
          },
          // Added a slight horizontal padding to the TextButton if needed,
          // though MainAxisAlignment.spaceBetween usually handles this well.
          style: TextButton.styleFrom(
            padding:
                EdgeInsets
                    .zero, // Remove default padding if it affects alignment
            alignment:
                Alignment
                    .centerRight, // Align text to the right within its bounds
          ),
          child: Text(
            'Forget Password ?',
            style: TextStyle(
              color: const Color(0xFF05485D),
              fontSize: fontSize,
              fontFamily: 'circulard std',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGradientButton({
    required String buttonText,
    required double buttonFontSize,
    required FontWeight buttonFontWeight,
    required double buttonHeight,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          _buttonRadius,
        ), // Applied radius here
        gradient: const LinearGradient(
          colors: [Color(0xFF034157), Color(0xFF1AC3C9)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_buttonRadius),
          ), // Applied radius here
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: buttonFontSize,
            fontWeight: buttonFontWeight,
            fontFamily: 'circulard std',
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton({
    required String buttonText,
    required double buttonFontSize,
    required FontWeight buttonFontWeight,
    required double buttonHeight,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF034157)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_buttonRadius),
          ), // Applied radius here
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: const Color(0xFF034157),
            fontSize: buttonFontSize,
            fontWeight: buttonFontWeight,
            fontFamily: 'circulard std',
          ),
        ),
      ),
    );
  }

  Widget _buildFooterText() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'By Signing up, you agree to Oh! vet’s\n',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(color: Color(0xFF2E86AB)),
          ),
          TextSpan(
            text: ' & ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(color: Color(0xFF2E86AB)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: 'circulard std', fontSize: 14.0),
    );
  }
}
