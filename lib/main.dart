import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Formulário de Login')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira o seu email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value) && value != 'aluno@ceub.edu.br') {
                return 'Por favor, insira um email válido';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _senhaController,
            decoration: InputDecoration(labelText: 'Senha'),
            obscureText: true,
            validator: (value) {
              if ((value == null || value.isEmpty) && value != '12345678') {
                return 'Por favor, insira a sua senha';
              } 
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                // Ação ao submeter o formulário
                final email = _emailController.text;
                final senha = _senhaController.text;
                // Realizar ação com o email e a senha, como fazer login
                print('Email: $email, Senha: $senha');
              }
            },
            child: Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
