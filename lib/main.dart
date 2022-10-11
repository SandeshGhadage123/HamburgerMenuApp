import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'burger_menu.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Inter',
    ),
    title: 'Hamburger Menu',
    home: HamburgerMenu(),
    debugShowCheckedModeBanner: false,
  ));
}

SharedPreferences localStorage;

TextEditingController emailController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

//String email = '';
//String password = '';

class HamburgerMenu extends StatefulWidget {
  static Future init() async {
    localStorage = await SharedPreferences.getInstance();
  }

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFb09696),
      appBar: AppBar(
        title: Text('Hamburger Menu Home'),
        backgroundColor: Color(0xFFb09696),
      ),
      endDrawer: burgermenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Form(
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xFFD9D9D9),
                      backgroundImage: NetworkImage('')),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: emailController,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty ? "please Enter Email" : null;
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (String value) {},
                      validator: (value) {
                        return value!.isEmpty
                            ? "please Enter valid Password"
                            : null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () => {
                        save(),
                      },
                      child: Text('Login'),
                      color: Colors.teal,
                      textColor: Colors.white,
                    ),
                  ),
                  if (localStorage != null)
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "User Logged in!!! ->  Email Id: ${localStorage.get('email')}  Password: ${localStorage.get('password')}",
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

save() async {
  await HamburgerMenu.init();
  localStorage.setString('email', emailController.text.toString());
  localStorage.setString('password', passwordController.text.toString());
}
