// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woss_health_care/Common/ColorPalette.dart';
import 'package:woss_health_care/View/treatment_page.dart';

class PatientDetailPage extends StatefulWidget {
  late String patientName;
  PatientDetailPage(this.patientName);
  @override
  State<PatientDetailPage> createState() =>
      _PatientDetailPageState(patientName);
}

class _PatientDetailPageState extends State<PatientDetailPage> {
  late String patientName;
  int selectedIndex = 0;
  bool isActive = true;

  _PatientDetailPageState(this.patientName);
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return TreatmentPage();
                },
              ),
            );
          },
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                appBar(),
                SizedBox(height: 20),
                information(context),
                SizedBox(height: 20),
                Text(
                  'Treatments',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grayScale950),
                ),
                SizedBox(height: 20),
                filter(),
                SizedBox(height: 20),
                Container(
                  width: deviceSize.width,
                  height: 98,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.grayScale100,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(4, 10),
                      ),
                    ],
                    color: AppColor.grayScale00,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 66,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: (isActive)
                                ? AppColor.primary500
                                : AppColor.grayScale200,
                          ),
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              'assets/pill.png',
                              color: AppColor.grayScale00,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Take medicines',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  child: Image.asset('assets/clock.png',
                                      color: AppColor.grayScale600),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Time',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grayScale600),
                                )
                              ],
                            ),
                            Text(
                              '12:00 - 13:00 Today',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            )
                          ],
                        ),
                        Spacer(),
                        (isActive)
                            ? Container(
                                // height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColor.secondary50,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Edit',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.secondary500)),
                                ),
                              )
                            : Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColor.green500,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: AppColor.grayScale00,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: deviceSize.width,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.grayScale100,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(4, 10),
                      ),
                    ],
                    color: AppColor.grayScale00,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 108,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: (isActive)
                                ? AppColor.secondary500
                                : AppColor.grayScale200,
                          ),
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              'assets/Barbell.png',
                              color: AppColor.grayScale00,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Do excercise',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  child: Image.asset('assets/clock.png',
                                      color: AppColor.grayScale600),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Time',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grayScale600),
                                )
                              ],
                            ),
                            Text(
                              '12:00 - 13:00 Today',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  child: Image.asset('assets/location.png',
                                      color: AppColor.grayScale600),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Place',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grayScale600),
                                )
                              ],
                            ),
                            Text(
                              'Building 2, Flr 1, Room 03',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            ),
                          ],
                        ),
                        Spacer(),
                        (isActive)
                            ? Container(
                                // height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColor.secondary50,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Edit',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.secondary500)),
                                ),
                              )
                            : Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColor.green500,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: AppColor.grayScale00,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: deviceSize.width,
                  height: 182,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.grayScale100,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(4, 10),
                      ),
                    ],
                    color: AppColor.grayScale00,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: (isActive)
                                  ? AppColor.yellow500
                                  : AppColor.grayScale200),
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              'assets/scope.png',
                              color: AppColor.grayScale00,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Physical therapy',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  child: Image.asset('assets/clock.png',
                                      color: AppColor.grayScale600),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Time',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grayScale600),
                                )
                              ],
                            ),
                            Text(
                              '12:00 - 13:00 Today',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  child: Image.asset('assets/doctor.png',
                                      color: AppColor.grayScale600),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Doctor',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grayScale600),
                                )
                              ],
                            ),
                            Text(
                              'Chris Evan',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  child: Image.asset('assets/location.png',
                                      color: AppColor.grayScale600),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Place',
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grayScale600),
                                )
                              ],
                            ),
                            Text(
                              'Building 2, Flr 1, Room 03',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            ),
                          ],
                        ),
                        Spacer(),
                        (isActive)
                            ? Container(
                                // height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColor.secondary50,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Edit',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.secondary500)),
                                ),
                              )
                            : Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: AppColor.red500,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Image.asset('assets/cancel.png'),
                              ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        Text(
          'Details',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColor.grayScale950),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(48),
            color: AppColor.red500,
          ),
          child: Center(child: Image.asset('assets/large_pined.png')),
        )
      ],
    );
  }

  Widget information(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Container(
      width: deviceSize.width - 48,
      height: 308,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.grayScale50,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage((patientName == 'Jennie Kim')
                      ? 'https://picsum.photos/id/237/200/300'
                      : 'https://picsum.photos/200/300'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      patientName,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.grayScale950),
                    ),
                    SizedBox(height: 10),
                    Text('ID: 003 - 421',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale500)),
                  ],
                ),
                Spacer(),
                Container(
                  // height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.secondary100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Edit',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.secondary500)),
                  ),
                ),
              ],
            ),
            DottedLine(
              dashColor: AppColor.grayScale100,
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.grayScale00,
                  ),
                  child: Center(
                    child: Icon(Icons.calendar_month_outlined),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale600)),
                    Text('22/09/1965',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale950))
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.grayScale00,
                  ),
                  child: Center(
                    child: Icon(Icons.person_outline_sharp),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale600)),
                    Text('Female',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale950))
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.grayScale00,
                  ),
                  child: Center(
                    child: Icon(Icons.phone_outlined),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone number',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale600)),
                    Text('090 000 123',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale950))
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.grayScale00,
                  ),
                  child: Center(
                    child: Icon(Icons.email_outlined),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale600)),
                    Text('jenniekim123@gmail.com',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale950))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget filter() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 0;
              isActive = true;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: (selectedIndex == 0)
                    ? AppColor.primary50
                    : Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Center(
                child: Text(
                  'All',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: (selectedIndex == 0)
                          ? AppColor.primary500
                          : AppColor.grayScale400),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 1;
              isActive = true;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: (selectedIndex == 1)
                    ? AppColor.primary50
                    : Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Center(
                child: Text(
                  'Active',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: (selectedIndex == 1)
                          ? AppColor.primary500
                          : AppColor.grayScale400),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 2;
              isActive = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: (selectedIndex == 2)
                    ? AppColor.primary50
                    : Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Center(
                child: Text(
                  'Inactive',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: (selectedIndex == 2)
                          ? AppColor.primary500
                          : AppColor.grayScale400),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
