import 'package:flutter/material.dart';
import 'login_page.dart'; // Make sure this file exists

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool rememberMe = false;

  final double _buttonRadius = 3.39; // Define the desired radius here

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final double uniformButtonHeight =
        screenHeight * 0.045; // Consistent button height

    return Scaffold(
      // Remove backgroundColor as it's handled by the Container's gradient
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF034157), Color(0xFF1AC3C9)],
            stops: [0.01, 0.98],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        // Removed SafeArea to match the full-screen background of the screenshot
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.03), // Adjusted proportionally
              Image.asset(
                'assets/logo_ohvet.png', // Assuming this is your logo file
                height: screenHeight * 0.07, // Adjusted proportionally
              ),
              SizedBox(height: screenHeight * 0.07), // Adjusted proportionally

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
              const SizedBox(height: 13), // Consistent spacing
              _buildSocialButton(
                color: Colors.white,
                icon: 'assets/google_icon.png',
                text: 'Continuer avec Google',
                textColor: const Color(0xFF4285F4),
                buttonFontSize: 15,
                buttonFontWeight: FontWeight.bold,
                buttonHeight: uniformButtonHeight,
              ),
              const SizedBox(height: 12), // Consistent spacing

              _buildSeparator(),
              const SizedBox(height: 12), // Consistent spacing

              _buildInputField(
                label: 'Email Address',
                hint: 'contact@ohvet.ma',
                controller: _emailController,
              ),
              const SizedBox(height: 8), // Consistent spacing

              _buildPasswordField(),
              const SizedBox(height: 8), // Consistent spacing

              _buildInputField(
                label: 'Confirm Password',
                hint: '••••••••••••••',
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 8), // Consistent spacing

              _buildRememberMeSection(fontSize: 13.57),
              const SizedBox(height: 12), // Consistent spacing

              _buildSignUpButton(
                buttonText: 'Sign Up',
                buttonFontSize: 15,
                buttonFontWeight: FontWeight.w600,
                buttonHeight: uniformButtonHeight,
                onPressed: () {
                  // Add your sign-up logic here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
              const SizedBox(height: 13), // Consistent spacing

              _buildLoginButton(
                buttonText: 'Login',
                buttonFontSize: 15,
                buttonFontWeight: FontWeight.bold,
                buttonHeight: uniformButtonHeight,
                onPressed: () {
                  Navigator.pop(context); // Go back to the login page
                },
              ),
              const SizedBox(height: 20), // Consistent spacing

              _buildFooterText(),
              SizedBox(height: screenHeight * 0.02), // Adjusted proportionally
            ],
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
          print(isFacebook ? 'Sign Up with Facebook' : 'Continue with Google');
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
        color: Colors.white, // Changed to white to match the screenshot
        fontFamily: 'circulard std',
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool obscureText = false, // Added obscureText parameter
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white, // Changed to white to match the screenshot
            fontSize: 13, // Adjusted font size to match login page
            fontWeight: FontWeight.w500,
            fontFamily: 'circulard std', // Added font family
          ),
        ),
        const SizedBox(height: 2), // Adjusted spacing
        Stack(
          children: [
            TextField(
              controller: controller,
              obscureText: obscureText, // Use the new obscureText parameter
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16, // Adjusted font size
                color: Colors.white, // Input text color to white
                fontFamily: 'circulard std',
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(
                  color:
                      Colors
                          .white70, // Hint text color for visibility on gradient
                  fontFamily: 'circulard std',
                ),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.transparent, // Ensure transparent fill
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 2, // Line thickness
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
    return _buildInputField(
      label: 'Password',
      hint: '••••••••••••••',
      controller: _passwordController,
      obscureText: true, // Set obscureText to true for passwords
    );
  }

  Widget _buildRememberMeSection({required double fontSize}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.8,
              child: Checkbox(
                value: rememberMe,
                onChanged: (value) => setState(() => rememberMe = value!),
                activeColor:
                    Colors.white, // Changed to white to match the screenshot
                checkColor: const Color(0xFF05485D), // Check mark color
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            Text(
              'Remember me',
              style: TextStyle(
                color: Colors.white, // Changed to white to match the screenshot
                fontSize: fontSize,
                fontFamily: 'circulard std',
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            print('Forget Password ? clicked');
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerRight,
          ),
          child: Text(
            'Forget Password ?',
            style: TextStyle(
              color: Colors.white, // Changed to white to match the screenshot
              fontSize: fontSize,
              fontFamily: 'circulard std',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton({
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
        color: Colors.white, // Solid white background
        borderRadius: BorderRadius.circular(_buttonRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              Colors
                  .transparent, // Make background transparent for container color
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_buttonRadius),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: const Color(
              0xFF05495E,
            ), // Text color matching the login page button
            fontSize: buttonFontSize,
            fontWeight: buttonFontWeight,
            fontFamily: 'circulard std',
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton({
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
          colors: [Color(0xFF18B4BC), Color(0xFF05495E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        // Changed from TextButton to ElevatedButton for consistency
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_buttonRadius),
          ),
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

  Widget _buildFooterText() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'By Signing up, you agree to Oh! vet’s\n',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ), // Changed to white
          ),
          TextSpan(
            text: 'Terms and Conditions',
            style: TextStyle(color: Color(0xFF2E86AB)),
          ),
          TextSpan(
            text: ' & ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ), // Changed to white
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
