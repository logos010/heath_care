// ignore_for_file: prefer_const_constructors

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:woss_health_care/Common/ColorPalette.dart';
import 'package:woss_health_care/View/patient_page.dart';

class HomePageDoctor extends StatefulWidget {
  @override
  State<HomePageDoctor> createState() => _HomePageDoctorState();
}

class _HomePageDoctorState extends State<HomePageDoctor> {
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
            PatientPage(),
            Container(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        itemCornerRadius: 16,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        showElevation: true,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text(
              'Patients',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            textAlign: TextAlign.center,
            activeColor: AppColor.primary500,
            inactiveColor: AppColor.grayScale950,
            icon: Image.asset('assets/patient.png'),
          ),
          BottomNavyBarItem(
            title: Text(
              'Menu',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            textAlign: TextAlign.center,
            activeColor: AppColor.yellow500,
            inactiveColor: AppColor.grayScale950,
            icon: Image.asset(
              'assets/menu.png',
              color: AppColor.yellow500,
            ),
          ),
        ],
      ),
    );
  }
}
