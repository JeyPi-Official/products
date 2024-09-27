// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, unnecessary_new, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:products/providers/login_form_provider.dart';
import 'package:products/widgets/background_login.dart';
import 'package:products/widgets/card_container.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundLogin(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 220,
              ),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Log In',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ChangeNotifierProvider(
                      create: (context) => LoginFormProvider(),
                      child: _LoginForm(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Sign In',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  // const _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 2,
                    ),
                  ),
                  hintText: 'somebody@mail.com',
                  labelText: 'Mail',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.alternate_email_sharp,
                    color: Colors.deepPurple,
                  ),
                ),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'Mail is not valid';
                }),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                    width: 2,
                  ),
                ),
                hintText: '******',
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: Colors.deepPurple,
                ),
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'Password should be more than 6 chars';
              },
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color.fromARGB(255, 173, 22, 200),
              child: Text(
                loginForm.isLoading ? 'Loading...' : 'Ingresar',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (loginForm.isLoading) {
                  return;
                }

                // Ejecutar la función anónima asíncrona
                () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('isLoading es false'),
                    ),
                  );

                  FocusScope.of(context).unfocus();

                  if (!loginForm.isValid()) return;

                  loginForm.isLoading = true;

                  await Future.delayed(Duration(seconds: 2));

                  loginForm.isLoading = false;

                  if (context.mounted) {
                    Navigator.pushReplacementNamed(context, 'home');
                  }
                }();
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
