import 'package:flutter/material.dart';
import 'package:flutter_sqllite_poc/models/user_details_model.dart';

class UserDetails extends StatelessWidget {
  UserDetails(this.userDetailsModel);
  UserDetailsModel userDetailsModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'username: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(userDetailsModel.username),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'password: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(userDetailsModel.password),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/all_users_details');
                    },
                    child: Text(
                      'show all users',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
