import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/main.dart';
import 'package:firebase_database/firebase_database.dart';
void main() => runApp(reg());

class reg extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _regState();
  }
}

class _regState extends State<reg> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  late DatabaseReference dbRef;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;
  @override
  void initState(){
    super.initState();
    dbRef= FirebaseDatabase.instance.ref().child('Information');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Center(child: Text("User registration Page")),
          ),
          body:StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context,snapshot){
                if(snapshot.connectionState== ConnectionState.waiting) return Center(child: CircularProgressIndicator(),);
                else if (snapshot.hasError) return Center(child: Text('An error occured'),);
                else if (snapshot.hasData){ return hom();}
                else return
             SingleChildScrollView(
              child: Form(
                key: _key,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(errorMessage),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('WELOME NEW ELC MEMBER!',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.orangeAccent
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    User(),
                    Email(),
                    Pass(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      //padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: 'Enter secure password'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(errorMessage),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () async {
                          setState(()=> isLoading= true);
                          if (_key.currentState!.validate()) {
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim());
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => hom()),);
                              errorMessage ='';
                            } on FirebaseAuthException catch (error) {
                              errorMessage = error.message!;}
                            setState(() =>isLoading= false);
                          }
                        },
                        child:isLoading?CircularProgressIndicator(color: Colors.blue,)
                        :Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Hyper(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );},
          ),
        ));
  }

  Widget Email() => Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: emailController,
          validator: validateEmail,
          style: TextStyle(color: Colors.black),
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
        controller: usernameController,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            hintText: 'Enter valid usernane as joseph'),
      ));
  Widget Pass() => Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: passwordController,validator: validatePassword,
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: ' Enter Password',
              hintText: 'Enter your password'),
        ),
      );
  Hyper() => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => elc()),
      );
    },
    child: RichText(
      text: TextSpan(
        text: '',
        style: TextStyle(color: Colors.black, fontSize: 15),
        children: const <TextSpan>[
          TextSpan(
              text: 'Already has account?',
              style: TextStyle(color: Colors.brown, fontSize: 15)),
          TextSpan(
              text: ' Sign In',
              style: TextStyle(color: Colors.blue, fontSize: 15)),
        ],
      ),
    ),
  );
  Widget Pass2() => Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Confirm your password'),
        ),
      );
  Widget Dev() => Row(
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
            color: Colors.black,
          ),
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

  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty) return 'Email required';

    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formEmail)) return 'invalid email adresss';
    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty) return 'Password required';
    String pattern = r'^[a-zA-Z0-9]{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(formPassword))
      return '''Password must be at least 8 characters,
  include an uppercase letter, number and symbol.''';
    return null;
  }
}
