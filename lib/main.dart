import 'package:flutter/material.dart';

import 'burger_menu.dart';

void main(){
  runApp(
    MaterialApp(

      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      title: 'Hamburger Menu',
      home: HamburgerMenu(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class HamburgerMenu extends StatefulWidget {

  @override
  State<HamburgerMenu> createState() => _HamburgerMenuState();
}

class _HamburgerMenuState extends State<HamburgerMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFb09696),
      //appBar: AppBar(title: Text('Hamburger Menu Home'),),
      endDrawer: burgermenu(),
    );
  }
}
