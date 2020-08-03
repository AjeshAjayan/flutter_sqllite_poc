import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sqllite_poc/database_helper.dart';
import 'package:flutter_sqllite_poc/models/user_details_model.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _contaiinerWidth = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Builder(
        builder: (context) => SafeArea(
          child: Center(
            child: Form(
              key: _form,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: _contaiinerWidth,
                    child: TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Username is mandatory';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Username'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: _contaiinerWidth,
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is mandatory';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Password',
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: RaisedButton(
                        onPressed: () {
                          if (_form.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Let\'s Go'),
                              ),
                            );
                            Map<String, dynamic> row = {
                              'username': usernameController.text,
                              'password': passwordController.text,
                            };
                            DatabaseHelper.instance.database.then((db) => {
                                  db.insert('users', row),
                                });
                            Navigator.of(context).pushNamed(
                              '/user_details',
                              arguments: UserDetailsModel(
                                usernameController.text,
                                passwordController.text,
                              ),
                            );
                          }
                        },
                        child: Text('Next',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )),
                        color: Colors.blueAccent,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
