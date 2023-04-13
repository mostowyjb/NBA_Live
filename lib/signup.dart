import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: _loading
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() == true) {
                          setState(() {
                            _loading = true;
                          });
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                            Navigator.pushNamed(context, '/');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                            }
                            setState(() {
                              _loading = false;
                            });
                          } catch (e) {
                            print(e);
                            setState(() {
                              _loading = false;
                            });
                          }
                        }
                      },
                      child: Text('Create Account'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
