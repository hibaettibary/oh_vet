import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'signup_page.dart'; // Import ajouté
import 'Conditions.dart';
=======
import 'signup_page.dart';
import 'Conditions.dart'; // Assurez-vous que ce fichier existe

>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;

<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
=======
  final double _buttonRadius = 3.39; // Define the desired radius here

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double uniformButtonHeight = screenHeight * 0.055;

>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
<<<<<<< HEAD
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

=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
            _buildInputField(
              label: 'Email Address',
              hint: 'contact@ohvet.ma',
              controller: _emailController,
            ),
<<<<<<< HEAD
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
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
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
<<<<<<< HEAD
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
        color: color,
        border: isFacebook ? null : Border.all(color: Colors.grey),
      ),
      child: TextButton(
<<<<<<< HEAD
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFacebook
                ? Text(
<<<<<<< HEAD
                    'f',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Image.asset(icon, width: 24, height: 24),
            const SizedBox(width: 12),
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
            Text(
              text,
              style: TextStyle(
                color: textColor,
<<<<<<< HEAD
                fontWeight: FontWeight.w500,
=======
                fontSize: buttonFontSize,
                fontWeight: buttonFontWeight,
                fontFamily: 'circulard std',
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator() {
<<<<<<< HEAD
  return const Text(
    '- OR -',
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 13.57,
    ),
    textAlign: TextAlign.center,
  );
}
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315

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
<<<<<<< HEAD
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
=======
            fontSize: 13,
            fontWeight: FontWeight.w500,
            fontFamily: 'circulard std',
          ),
        ),
        const SizedBox(height: 2),
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
        Stack(
          children: [
            TextField(
              controller: controller,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
<<<<<<< HEAD
                fontSize: 20.36,
              ),
              decoration: const InputDecoration(
                hintText: 'contact@ohvet.ma',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
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
<<<<<<< HEAD
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
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
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

<<<<<<< HEAD
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
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
            ),
          ],
        ),
        TextButton(
<<<<<<< HEAD
          onPressed: () {},
          child: const Text(
            'Forget Password ?',
            style: TextStyle(color: Color(0xFF05485D)),
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
          ),
        ),
      ],
    );
  }

<<<<<<< HEAD
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
        onPressed: () {
           
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ConditionsPage()),
                            );
                          },
        
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
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
          ),
        ),
      ),
    );
  }

<<<<<<< HEAD
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
=======
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
        ),
      ),
    );
  }

  Widget _buildFooterText() {
    return const Text.rich(
      TextSpan(
        children: [
<<<<<<< HEAD
          TextSpan(text: 'By Signing up, you agree to Oh! vet’s\n'),
=======
          TextSpan(
            text: 'By Signing up, you agree to Oh! vet’s\n',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(color: Color(0xFF2E86AB)),
          ),
<<<<<<< HEAD
          TextSpan(text: ' & '),
=======
          TextSpan(
            text: ' & ',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(color: Color(0xFF2E86AB)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
<<<<<<< HEAD
    );
  }
}
=======
      style: TextStyle(fontFamily: 'circulard std', fontSize: 14.0),
    );
  }
}
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
