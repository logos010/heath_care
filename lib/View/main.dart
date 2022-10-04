// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:woss_health_care/Common/ColorPalette.dart';
import 'package:woss_health_care/View/HomeTab/RewardPage.dart';
import 'package:woss_health_care/View/start_page.dart';

import 'HomeTab/ReminderPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            ReminderPage(),
            RewardPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        showElevation: true,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text(
              'Reminder',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            activeColor: AppColor.primary500,
            inactiveColor: AppColor.grayScale950,
            icon: Image.asset('assets/reminder.png'),
          ),
          BottomNavyBarItem(
            title: Text(
              'Reward',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            activeColor: AppColor.yellow500,
            inactiveColor: AppColor.grayScale950,
            icon: Image.asset(
              'assets/reward.png',
              color: AppColor.yellow500,
            ),
          ),
        ],
      ),
    );
  }
}
