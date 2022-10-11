import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled/draggable.dart';
import 'package:untitled/home.dart';
import 'package:untitled/register.dart';
import 'package:untitled/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
       );
  runApp(MaterialApp(
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFEFEFEF)),
    debugShowCheckedModeBanner: false,
    home: elc(),
  ));
}

class elc extends StatefulWidget {

  @override
  State<elc> createState() => _elcState();
}

class _elcState extends State<elc> {
   ValueNotifier<ThemeMode>  get _err => ValueNotifier(ThemeMode.light);
   final emailController= TextEditingController();
   final passwordController= TextEditingController();
   final GlobalKey<FormState> _key= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.orange[100],

      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Center(child: Text("Login Page")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: Image.network(
                          'https://images.unsplash.com/photo-1633989464081-16ccd31287a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZWxwJTIwdGV4dHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Email(),
              SizedBox(
                height: 20,
              ),
              Pass(),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.brown, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async{
                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                  setState(() {
                  });
                    },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Yap()),
                  );
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.brown, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Hyper(),
              SizedBox(
                height: 50,
              ),

              /*Text('New User? Create Account')*/
            ],
          ),
        ),
      ),
    );
  }

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
        child: TextFormField(
          controller: passwordController,validator: validatePassword,
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter your password'),
        ),
      );

  Widget Email() => Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
        //padding: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: emailController,validator: validateEmail,
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'Enter your Email'),
        ),
      );

  Hyper() => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => reg()),
          );
        },
        child: RichText(
          text: TextSpan(
            text: 'New user?',
            style: TextStyle(color: Colors.black, fontSize: 15),
            children: const <TextSpan>[
              TextSpan(
                  text: 'New user?',
                  style: TextStyle(color: Colors.brown, fontSize: 15)),
              TextSpan(
                  text: ' Register',
                  style: TextStyle(color: Colors.blue, fontSize: 15)),
            ],
          ),
        ),
      );
}
String? validateEmail(String? formEmail){
  if (formEmail ==null|| formEmail.isEmpty)
    return'Email required';

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'invalid email adresss';
  return null;
}
String? validatePassword(String? formPassword){
  if (formPassword ==null|| formPassword.isEmpty)
    return'Email required';
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp (pattern);
  if (!regex. hasMatch(formPassword))
    return '''Password must be at least 8 characters,
  include an uppercase letter, number and symbol.''';
  return null;
}