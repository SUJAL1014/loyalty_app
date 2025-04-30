import 'package:flutter/material.dart';
import '../widgets/curved_header.dart';
import 'signup_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _error;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    await Future.delayed(const Duration(seconds: 1)); // Simulate login
    setState(() {
      _isLoading = false;
    });
    // On success, navigate to dashboard and clear stack
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark ? Color(0xFF19223E) : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedHeader(title: "Welcome", subtitle: "Sign in to continue"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  _buildTextField("Email", "your email address goes here", _emailController, false),
                  SizedBox(height: 16),
                  _buildTextField("Password", "********", _passwordController, true),
                  if (_error != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(_error!, style: TextStyle(color: Colors.redAccent)),
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Forgot Password?", style: TextStyle(color: Colors.white70)),
                    ),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF19223E),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: _isLoading ? null : _signIn,
                    child: _isLoading
                        ? SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2))
                        : Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 16),
                  Center(child: Text("OR", style: TextStyle(color: Colors.white54))),
                  SizedBox(height: 8),
                  Center(child: Text("Connect with", style: TextStyle(color: Colors.white54))),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(Icons.g_mobiledata),
                      SizedBox(width: 16),
                      _buildSocialIcon(Icons.facebook),
                      SizedBox(width: 16),
                      _buildSocialIcon(Icons.apple),
                    ],
                  ),
                  SizedBox(height: 24),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => SignupScreen()),
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Don't have Account? ",
                          style: TextStyle(color: Colors.white54),
                          children: [
                            TextSpan(
                              text: "Sign up",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller, bool obscure) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white38),
        filled: true,
        fillColor: Color(0xFF232B4D),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 18,
      child: Icon(icon, color: Color(0xFF19223E)),
    );
  }
} 