import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.deepPurple,
      width: 250,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(accountName: Text('Shriya'), accountEmail: Text('shriya@gmail.com'), 
          decoration: BoxDecoration(gradient: LinearGradient(colors:  [Colors.white54, Colors.white70],)),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/panda.jpeg'),
          
          )),

          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.white,
            ),
            title: Text('Home', style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
            title: Text('Send an Email', style: TextStyle(color: Colors.white),),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.white,
            ),
            title: Text('Profile', style: TextStyle(color: Colors.white),),
          ),

        ],
      )
    );
  }
}