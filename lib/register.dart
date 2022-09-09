import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
void main() => runApp(reg());

class reg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _regState();
  }
}

class _regState extends State<reg> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.black54,
          appBar: AppBar(
            backgroundColor: Colors.black87,
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
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage('https://pbs.twimg.com/media/FFLheCWXsAEmRqE.jpg')),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),),
                  ),
                ),
                User(),
                Email(),
                Pass(),
                Pass2(),
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
  Widget Email() => Padding(
    padding:
    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
    //padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      obscureText: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'Enter your Email'),
    ),
  );
  Widget User() => Padding(
    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter valid usernane as joseph'),
      ));
  Widget Pass() => Padding(
    padding:
    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
    //padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Enter your password'),
    ),
  );
  Widget Pass2() => Padding(
    padding:
    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
    //padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Confirm Password',
          hintText: 'Confirm your password'),
    ),
  );
  Widget Dev () =>Row(
    children: [
      IconButton(
        icon: Icon(
          Icons.login,
          color: Colors.white,
        ),
        onPressed: () {
          // do something
        },
      ),
      Divider(
  color: Colors.black,),
      IconButton(
        icon: Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
        onPressed: () {
          // do something
        },
      ),
    ],
  );
   }
