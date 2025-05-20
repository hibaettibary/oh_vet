import 'package:flutter/material.dart';
<<<<<<< HEAD
<<<<<<<< HEAD:frontend/lib/screens/signup_page.dart
import 'login_page.dart';
========
import 'login_page.dart'; // Make sure this file exists
>>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315:frontend/lib/signup_page.dart
=======
import 'login_page.dart';
import '../services/auth_service.dart';
import '../models/Utilisateur_model.dart';
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
<<<<<<< HEAD
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
<<<<<<<< HEAD:frontend/lib/screens/signup_page.dart
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30), // Réduit l'espace après le SafeArea
                    Image.asset(
                      'assets/logo_ohvet.png',
                      height: 100,
                    ),
                    const SizedBox(height: 20), // Réduit l'espace après le logo
                    _buildSocialButton(
                      color: const Color(0xFF425F9E),
                      icon: 'f',
                      text: 'Sign Up with Facebook',
                      isFacebook: true,
                    ),
                    const SizedBox(height: 10), // Réduit l'espace après le bouton Facebook
                    _buildSocialButton(
                      color: Colors.white,
                      icon: 'assets/google_icon.png',
                      text: 'Continuer avec Google',
                      textColor: const Color(0xFF4285F4),
                    ),
                    const SizedBox(height: 16), // Réduit l'espace avant le séparateur
                    _buildSeparator(),
                    const SizedBox(height: 16), // Réduit l'espace après le séparateur
                    _buildInputField(
                      label: 'Email Address',
                      hint: 'contact@ohvet.ma',
                      controller: _emailController,
                    ),
                    const SizedBox(height: 16), // Réduit l'espace après l'e-mail
                    _buildPasswordField(),
                    const SizedBox(height: 16), // Réduit l'espace après le mot de passe
                    _buildInputField(
                      label: 'Confirm Password',
                      hint: '••••••••••••••',
                      controller: _confirmPasswordController,
                    ),
                    const SizedBox(height: 8), // Réduit l'espace avant "Remember me"
                    _buildRememberMeSection(),
                    const SizedBox(height: 16), // Réduit l'espace avant le bouton "Sign Up"
                    _buildSignUpButton(),
                    const SizedBox(height: 10), // Réduit l'espace avant le bouton "Login"
                    _buildLoginButton(),
                    const SizedBox(height: 16), // Réduit l'espace avant le texte du bas
                    _buildFooterText(),
                    const SizedBox(height: 16), // Réduit l'espace après le texte du bas
                  ],
                ),
              ),
            ),
========
        // Removed SafeArea to match the full-screen background of the screenshot
=======
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool rememberMe = false;
  bool _isLoading = false;

  final AuthService _authService = AuthService();

  void _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showMessage("Veuillez remplir tous les champs");
      return;
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      _showMessage("Email invalide");
      return;
    }

    if (password != confirmPassword) {
      _showMessage("Les mots de passe ne correspondent pas");
      return;
    }

    setState(() => _isLoading = true);

    // Création d’un objet Utilisateur à partir des infos saisies
    final utilisateur = Utilisateur(
      email: email,
      password: password,
      nom: '',
      prenom: '',
      telephone: '',
      adresse: '',
      ville: '',
      codePostal: '',
      dateInscription: DateTime.now(),
      photoUrl: '',
    );

    // Appel du service d'inscription
    final success = await _authService.register(utilisateur);

    setState(() => _isLoading = false);

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    } else {
      _showMessage("Erreur lors de l'inscription");
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMainContent(),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.4),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF034157), Color(0xFF1AC3C9)],
          stops: [0.01, 0.98],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
<<<<<<< HEAD
              SizedBox(height: screenHeight * 0.03), // Adjusted proportionally
              Image.asset(
                'assets/logo_ohvet.png', // Assuming this is your logo file
                height: screenHeight * 0.07, // Adjusted proportionally
              ),
              SizedBox(height: screenHeight * 0.07), // Adjusted proportionally
=======
              const SizedBox(height: 60),
              Image.asset('assets/logo_ohvet.png', height: 100),
              const SizedBox(height: 40),
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315

              _buildSocialButton(
                color: const Color(0xFF425F9E),
                icon: 'f',
                text: 'Sign Up with Facebook',
                isFacebook: true,
<<<<<<< HEAD
                iconFontSize: 18,
                buttonFontSize: 15,
                buttonFontWeight: FontWeight.bold,
                buttonHeight: uniformButtonHeight,
              ),
              const SizedBox(height: 13), // Consistent spacing
=======
              ),
              const SizedBox(height: 16),

>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
              _buildSocialButton(
                color: Colors.white,
                icon: 'assets/google_icon.png',
                text: 'Continuer avec Google',
                textColor: const Color(0xFF4285F4),
<<<<<<< HEAD
                buttonFontSize: 15,
                buttonFontWeight: FontWeight.bold,
                buttonHeight: uniformButtonHeight,
              ),
              const SizedBox(height: 12), // Consistent spacing

              _buildSeparator(),
              const SizedBox(height: 12), // Consistent spacing
=======
              ),
              const SizedBox(height: 24),

              // Le texte "or"
              const Text(
                'or',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 24),
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315

              _buildInputField(
                label: 'Email Address',
                hint: 'contact@ohvet.ma',
                controller: _emailController,
              ),
<<<<<<< HEAD
              const SizedBox(height: 8), // Consistent spacing

              _buildPasswordField(),
              const SizedBox(height: 8), // Consistent spacing
=======
              const SizedBox(height: 24),

              _buildInputField(
                label: 'Password',
                hint: '••••••••••••••',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 24),
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315

              _buildInputField(
                label: 'Confirm Password',
                hint: '••••••••••••••',
                controller: _confirmPasswordController,
<<<<<<< HEAD
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
>>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315:frontend/lib/signup_page.dart
=======
                obscureText: true,
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
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required Color color,
    required String icon,
    required String text,
<<<<<<< HEAD
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
<<<<<<<< HEAD:frontend/lib/screens/signup_page.dart
                ? const Text(
              'f',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
                : Image.asset(icon, width: 24, height: 24),
            const SizedBox(width: 12),
========
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
>>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315:frontend/lib/signup_page.dart
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
=======
    Color? textColor,
    bool isFacebook = false,
  }) {
    // Ton code original ici, par exemple :
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        // TODO: gérer connexion sociale
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isFacebook
              ? Text(
                  icon,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              : Image.asset(icon, height: 24),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
      ),
    );
  }

<<<<<<< HEAD
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

=======
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
<<<<<<< HEAD
    bool obscureText = false, // Added obscureText parameter
=======
    bool obscureText = false,
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
<<<<<<< HEAD
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
=======
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
            ),
          ),
        ),
      ],
    );
  }

<<<<<<< HEAD
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
<<<<<<<< HEAD:frontend/lib/screens/signup_page.dart
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
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
========
      style: TextStyle(fontFamily: 'circulard std', fontSize: 14.0),
>>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315:frontend/lib/signup_page.dart
    );
  }
}
=======
  Widget _buildRememberMeSection() => Row(
        children: [
          Checkbox(
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = value!;
              });
            },
          ),
          const Text('Remember me', style: TextStyle(color: Colors.white)),
        ],
      );

  Widget _buildSignUpButton() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: _register,
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

  Widget _buildLoginButton() => TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        },
        child: const Text("Already have an account? Log In",
            style: TextStyle(color: Colors.white)),
      );

  Widget _buildFooterText() => const Text(
        'By signing up, you agree to our Terms & Conditions',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 12),
      );
}
>>>>>>> 29c0176ef127e1415daa76a85429f5d35cdf7315
