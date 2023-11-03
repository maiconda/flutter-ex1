
import 'package:flutter/material.dart';
import 'package:duasd/app_controller.dart';
import 'package:duasd/home_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Página de Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              InputText(type: 'Email', onChanged : (text) {
                setState(() {
                  email = text;
                });
              }),

              InputText(type: 'Senha', onChanged : (text) {
                setState(() {
                  senha = text;
                  });
              }),
              SubmitButton(email: email, senha: senha, contextLogin: context),
              SizedBox(height: 30)
            ],
          ),
        ),
    );
  }
}

class InputText extends StatelessWidget {
  final String type;
  final void Function(String) onChanged;

  InputText({required this.type, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        child: TextField(
          onChanged: onChanged,
          obscureText: type == 'Email' ? false : true,
          keyboardType: type == 'Email' ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
            labelText: type + ':',
          ),
        ),
      ),
    );
  }
}



class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/logo.png'),
      width: 270,
    );
  }
}


class SubmitButton extends StatelessWidget {

  final String email;
  final String senha;
  final BuildContext contextLogin;

  const SubmitButton({required this.email, required this.senha, required this.contextLogin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.only(top: 16.0),
      child: ElevatedButton(
        onPressed: () {
          if(email == '123' && senha == '123'){
            AppController.instance.incrementCounter();
            Navigator.of(contextLogin).pushReplacementNamed('/home');
          }
        },
        child: Text(
            'Entrar',
            style: TextStyle(
              fontSize: 18.5,
            ),
        ),
      ),
    );
  }
}