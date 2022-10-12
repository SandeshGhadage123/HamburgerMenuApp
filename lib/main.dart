import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hamburger_menu_redesign/user_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'burger_menu.dart';
import 'model/user.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Inter',
    ),
    title: 'Hamburger Menu',
    home: HamburgerMenu(),
    debugShowCheckedModeBanner: false,
  ));
}

class HamburgerMenu extends StatefulWidget {
  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  late User user;

  String get imageUrl => user.imageUrl;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

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
                  GestureDetector(
                    onTap: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image == null) return;

                      final directory =
                          await getApplicationDocumentsDirectory();
                      final name = basename(image.path);
                      final imageFile = File('${directory.path}/$name');
                      final newImage =
                          await File(image.path).copy(imageFile.path);

                      setState(() => user = user.copy(imageUrl: newImage.path));
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xFFD9D9D9),
                      backgroundImage: FileImage(File(imageUrl)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      initialValue: user.name,
                      onChanged: (name) => user = user.copy(name: name),
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        hintText: 'Enter Your Name Here',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        return value!.isEmpty ? "please Enter Name" : null;
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      //text: user.email,
                      keyboardType: TextInputType.visiblePassword,
                      initialValue: user.email,
                      onChanged: (email) => user = user.copy(email: email),
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      child: Text('Save'),
                      color: Colors.teal,
                      textColor: Colors.white,
                      onPressed: () {
                        UserPreferences.setUser(user);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
