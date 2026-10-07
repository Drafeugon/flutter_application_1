import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
  String mail = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset('asset/logo-twitter-noir.png', height: 30),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Entrez vos identifiants',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Entrez votre email';
          }
          return null;
        },
        onSaved: (value) => mail = value ?? '',
              ),
              SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                obscureText: _isPasswordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                 validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Entrez votre mot de passe';
          }
          if (value.length < 12) {
            return 'Entrez un mot de passe plus long (12 caractères minimum)';
          }
          return null;
        },
        onSaved: (value) => password = value ?? '',
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      formKey.currentState?.save();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                      // Handle login logic here
                    }
                  },
                  child: const Text('connexion'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}