import 'package:flutter/material.dart';
import 'login_page.dart';
import '../services/auth_service.dart';
import '../models/Utilisateur_model.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Image.asset('assets/logo_ohvet.png', height: 100),
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

              // Le texte "or"
              const Text(
                'or',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 24),

              _buildInputField(
                label: 'Email Address',
                hint: 'contact@ohvet.ma',
                controller: _emailController,
              ),
              const SizedBox(height: 24),

              _buildInputField(
                label: 'Password',
                hint: '••••••••••••••',
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 24),

              _buildInputField(
                label: 'Confirm Password',
                hint: '••••••••••••••',
                controller: _confirmPasswordController,
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
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required Color color,
    required String icon,
    required String text,
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
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            ),
          ),
        ),
      ],
    );
  }

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
