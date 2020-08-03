import 'package:flutter/material.dart';

import '../database_helper.dart';

class AllUsersDetails extends StatefulWidget {
  @override
  _AllUsersDetailsState createState() => _AllUsersDetailsState();
}

class _AllUsersDetailsState extends State<AllUsersDetails> {
  @override
  void initState() {
    setUsers();
    super.initState();
  }

  List<Map<String, dynamic>> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All user\'s details'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Container(
              height: 70,
              child: Card(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 20,
                        child: Text(users[index]['user_id'].toString()),
                      ),
                      Container(
                        width: 50,
                        child: Text(users[index]['username'].toString()),
                      ),
                      Container(
                        width: 50,
                        child: Text(users[index]['password'].toString()),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final database = await DatabaseHelper.instance.database;
    return await database.query('users');
  }

  void setUsers() async {
    List<Map<String, dynamic>> tusers = await getAllUsers();
    setState(() {
      users = tusers;
    });
  }
}
