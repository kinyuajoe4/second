import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(elc());

class elc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _elcState();
  }
}

class _elcState extends State<elc> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.brown,
        title: Center(child: Text("Login Page")),
    ),
    body: SingleChildScrollView(
    child: Column(
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(top: 60.0),
    child: Center(
    child: Container(
    width: 200,
    height: 150,
    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
    child:Image.network('https://pbs.twimg.com/media/FFLheCWXsAEmRqE.jpg')),
    ),
    ),
    Padding(
    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Username',
    hintText: 'Enter valid usernane as joseph'),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(
    left: 15.0, right: 15.0, top: 15, bottom: 0),
    //padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextField(

    obscureText: true,
    decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Password',
    hintText: 'Enter secure password'),
    ),
    ),
    TextButton(
    onPressed: (){

    },
    child: Text(
    'Forgot Password',
    style: TextStyle(color: Colors.brown, fontSize: 15),
    ),
    ),
    Container(
    height: 50,
    width: 250,
    decoration: BoxDecoration(
    color: Colors.brown, borderRadius: BorderRadius.circular(20)),
    child: TextButton(
    onPressed: () {
    Navigator.push(
    context, MaterialPageRoute(builder: (_) => elc()));
    },
    child: Text(
    'Login',
    style: TextStyle(color: Colors.white, fontSize: 25),
    ),
    ),
    ),
    SizedBox(
    height: 130,
    ),
    Text('New User? Create Account')
    ],
    ),
    ),
    ));
  }
}
