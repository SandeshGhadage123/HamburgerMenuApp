import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamburger_menu_redesign/user_preferences.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';


class burgermenu extends StatefulWidget {
  @override
  State<burgermenu> createState() => _burgermenuState();
}

class _burgermenuState extends State<burgermenu> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();
    //final name = 'Atish Darpel';
    //final email = 'team@blockchaininternational.com';
    //final imageUrl =
    //'https://image.shutterstock.com/image-photo/smiling-young-middle-eastern-man-260nw-2063524544.jpg';

    return Drawer(
      child: Material(
        child: ListView(
          children: [
            buildHeader(
                name: user.name, email: user.email, imageUrl: user.imageUrl),
            SizedBox(height: 5),
            Container(
              padding: padding,
              child: searchField(),
            ),
            SizedBox(height: 20),
            Container(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 18),
                      child: Text(
                        'Main',
                        style: TextStyle(fontSize: 14, color: Colors.black38),
                      )),
                  SizedBox(height: 25),
                  ExpansionTile(
                    title: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 16),
                    ),
                    leading: Icon(
                      Icons.dashboard,
                      //color: Colors.black,
                    ),
                    childrenPadding: EdgeInsets.only(left: 55),
                    //textColor: Colors.black,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  'Market',
                                  style: TextStyle(color: Colors.black45),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              child: LiteRollingSwitch(
                                value: true,
                                textOn: 'Market',
                                textOff: 'OFF',
                                width: 85,
                                textOnColor: Colors.white,
                                colorOn: Colors.blue,
                                colorOff: Colors.redAccent,
                                textSize: 9,
                                onTap: () {},
                                onDoubleTap: () {},
                                onSwipe: () {},
                                onChanged: (bool position) {
                                  print("the button is $position");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Discover',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF5EFEB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            'People & Organization',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'PRO CARDS',
                          style: TextStyle(color: Colors.black45),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 14),
                  Padding(
                      padding: EdgeInsets.only(left: 18),
                      child: Text(
                        'Analytics',
                        style: TextStyle(fontSize: 14, color: Colors.black38),
                      )),
                  SizedBox(height: 15),
                  items(
                    name: 'Coin List Index',
                    icon: Icons.list_alt,
                  ),
                  items(
                    name: 'Watchlist',
                    icon: Icons.favorite,
                  ),
                  items(
                    name: 'Portfolio',
                    icon: Icons.stacked_bar_chart,
                  ),
                  items(
                    name: 'Wallet',
                    icon: Icons.account_balance_wallet,
                  ),
                  items(
                    name: 'Notification',
                    icon: Icons.notifications_none,
                  ),
                  items(
                    name: 'Settings',
                    icon: Icons.settings,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget items({
  required String name,
  required IconData icon,
}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(
      name,
      style: TextStyle(color: Colors.black45),
    ),
    horizontalTitleGap: 7,
    onTap: () {},
  );
}

Widget searchField() {
  final color = Colors.black;
  final fillColor = Color(0xFFF5EFEB);
  return TextField(
    style: TextStyle(color: color),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.0),
        hintText: 'Search',
        prefixIcon: Visibility(
          child: Icon(Icons.search, color: Colors.black54),
        ),
        filled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color.withOpacity(0)),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: color.withOpacity(0)))),
  );
}

Widget buildHeader({
  required String name,
  required String email,
  required String imageUrl,
}) =>
    InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xFFD9D9D9),
                backgroundImage: FileImage(File(imageUrl))),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(email,
                    style: TextStyle(color: Colors.black45, fontSize: 9))
              ],
            )
          ],
        ),
      ),
    );
