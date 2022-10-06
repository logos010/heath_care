// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:woss_health_care/Common/ColorPalette.dart';
import 'package:woss_health_care/Model/ReminderModel.dart';
import 'package:woss_health_care/View/record_page.dart';
import 'package:woss_health_care/View/scan_page.dart';

class ReminderPage extends StatelessWidget {
  List<ReminderModel> reminders = [
    ReminderModel('TAKE MEDICINE', '07:00 - 08:00, Today', '',
        "It's time to take medicine", false),
    ReminderModel('TAKE MEDICINE', '12:00 - 13:00, Today', '',
        "It's time to take medicine", false),
    ReminderModel('TAKE MEDICINE', '18:00 - 19:00, Today', '',
        "It's time to take medicine", true),
    ReminderModel('PHYSICAL THERAPY', '05:00 - 06:00, Today', '',
        "It's time to finish", false),
    ReminderModel('PHYSICAL THERAPY', '17:00 - 18:00, Today', '',
        "It's time to finish", true),
  ];
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: deviceSize.width,
          height: deviceSize.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              appBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Hello, \nJennie',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grayScale950),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Image.asset('assets/hand.png'),
                  )
                ],
              ),
              SizedBox(height: 25),
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    width: deviceSize.width - 24,
                    height: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColor.primary500),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(120, 12, 12, 12),
                      child: Text(
                        'How are you today? \nRemember to take your medicine on time.',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grayScale600),
                      ),
                    ),
                  ),
                  Image.asset('assets/nutri.png'),
                ],
              ),
              SizedBox(height: 25),
              Text('Weekly Reminder',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grayScale950)),
              SizedBox(height: 20),
              Container(
                  width: deviceSize.width - 24,
                  height: 250,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.vertical,
                      autoPlay: false,
                    ),
                    items: reminders
                        .map(
                          (item) => Container(
                            width: deviceSize.width - 48,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: (item.type == 'TAKE MEDICINE' &&
                                        item.isAvailablel)
                                    ? AssetImage("assets/bg_blue.png")
                                    : (item.type == 'PHYSICAL THERAPY' &&
                                            item.isAvailablel)
                                        ? AssetImage("assets/bg_yellow.png")
                                        : AssetImage("assets/bg_gray.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: AppColor.grayScale00),
                                        child: Center(
                                          child: (item.type == 'TAKE MEDICINE')
                                              ? Image.asset(
                                                  'assets/pill.png',
                                                  color: (item.isAvailablel)
                                                      ? AppColor.primary500
                                                      : AppColor.grayScale200,
                                                )
                                              : Image.asset(
                                                  'assets/Barbell.png',
                                                  color: (item.isAvailablel)
                                                      ? AppColor.yellow500
                                                      : AppColor.grayScale200,
                                                ),
                                        ),
                                      ),
                                      SizedBox(width: 14),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(item.type,
                                              style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: AppColor.grayScale00)),
                                          Row(
                                            children: [
                                              Image.asset('assets/clock.png'),
                                              SizedBox(width: 5),
                                              Text(item.time,
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColor.grayScale00))
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                      (item.type == "TAKE MEDICINE")
                                          ? "It's time to take medicine"
                                          : "It's time to finish",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: AppColor.grayScale00)),
                                  SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      if (item.type == 'TAKE MEDICINE') {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => RecordPage(),
                                          ),
                                        );
                                      } else {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => ScanPage(),
                                          ),
                                        );
                                      }
                                    },
                                    child: Visibility(
                                      visible: item.isAvailablel,
                                      child: Row(
                                        children: [
                                          Spacer(),
                                          Container(
                                            width: 104,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: AppColor.grayScale00,
                                            ),
                                            child: Center(
                                              child: Text(
                                                  (item.type == "TAKE MEDICINE")
                                                      ? "Record now"
                                                      : "Scan now",
                                                  style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: (item.type ==
                                                              "TAKE MEDICINE")
                                                          ? AppColor.primary500
                                                          : AppColor
                                                              .yellow500)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        SizedBox(height: 50),
        Image.asset('assets/sun.png'),
        SizedBox(width: 8),
        Text(
          'Monday, Sep 11',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.primary500),
        ),
        Spacer(),
        Image.asset('assets/notification.png'),
        SizedBox(width: 18),
        CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage('https://picsum.photos/200/300'),
          backgroundColor: Colors.transparent,
        )
      ],
    );
  }
}
