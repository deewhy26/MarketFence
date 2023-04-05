
import 'package:flutter/material.dart';
import 'package:market_fence/Screens/root_page.dart';

import '../CustomUI/custom_button.dart';
import '../CustomUI/custom_square_tile.dart';
import '../CustomUI/custom_textformfield.dart';


class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

List<User> userList = [
  User(username: 'user1', password: 'password1'),
  User(username: 'user2', password: 'password2'),
  User(username: 'user3', password: 'password3'),
];

class LoginPage extends StatefulWidget {
   const LoginPage({Key? key}) : super(key: key);
   @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (checkCredentials(usernameController.text, passwordController.text, userList)) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RootPage()));
    }
    else
      {
        print("wrong input");
      }

  }
  bool checkCredentials(String username, String password, List<User> userList) {
    for (User user in userList) {
      if (user.username == username && user.password == password) {
        return true;
      }
    }
    return false;
  }




  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),

              // logo
              const Icon(
                Icons.lock,
                size: 100,
              ),

              const SizedBox(height: 50),

              // welcome back, you've been missed!
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              // username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(

                onTap: signUserIn
              ),

              const SizedBox(height: 50),

              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // google + apple sign in buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  SizedBox(width: 28),
                  // google button
                  SquareTile(imagePath: 'assets/google.png'),

                  SizedBox(width: 25),

                ],
              ),

              const SizedBox(height: 50),

              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                    onPressed: (){
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => ProfilePage()));
                    },
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
