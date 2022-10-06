// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Common/ColorPalette.dart';

class PatientPage extends StatelessWidget {
  List<String> patients = [
    'Jennie Kim',
    'Robert Downey Jr',
    'Jennie Kim',
    'Robert Downey Jr',
    'Jennie Kim'
  ];
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
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
                        'Hello, \nAngelina',
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
                  SizedBox(height: 24),
                  searchBar(context),
                  SizedBox(height: 24),
                  Text(
                    'All patients',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grayScale950,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return cardViewPatient(patients[index], context);
                },
              ),
            ),
          ],
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

  Widget searchBar(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Container(
      width: deviceSize.width,
      height: 48,
      child: Row(
        children: [
          Container(
            width: deviceSize.width * 0.75,
            height: 48,
            child: TextField(
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                color: AppColor.grayScale950,
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColor.grayScale400,
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
            ),
          ),
          Spacer(),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              color: AppColor.primary500,
            ),
            child: Center(
                child: Icon(
              Icons.keyboard_voice_rounded,
              color: AppColor.grayScale00,
            )),
          )
        ],
      ),
    );
  }

  Widget cardViewPatient(String patient, BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Container(
        width: deviceSize.width,
        height: 144,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.grayScale00,
          boxShadow: [
            BoxShadow(
              color: AppColor.grayScale100,
              blurRadius: 5,
              spreadRadius: 3,
              offset: Offset(4, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: deviceSize.width,
              height: 124,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage((patient == 'Jennie Kim')
                          ? 'https://picsum.photos/id/237/200/300'
                          : 'https://picsum.photos/200/300'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              patient,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grayScale950),
                            ),
                            SizedBox(width: 10),
                            Visibility(
                              visible: (patient == 'Jennie Kim'),
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppColor.red500,
                                ),
                                child: Center(
                                  child: Image.asset('assets/pined.png'),
                                ),
                              ),
                            )
                          ],
                        ),
                        Text('ID: 003 - 421',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grayScale500)),
                        Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.primary500,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/pill.png',
                                  color: AppColor.grayScale00,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.secondary500,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/Barbell.png',
                                  color: AppColor.grayScale00,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.yellow500,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/scope.png',
                                  color: AppColor.grayScale00,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.grayScale100,
                              ),
                              child: Center(
                                child: Text('+5',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.grayScale400)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      // height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColor.primary50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('View',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary500)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: deviceSize.width,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16)),
                  color: AppColor.grayScale25),
              alignment: Alignment.center,
              child: Container(
                width: deviceSize.width - 48 * 2,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColor.grayScale100),
                alignment: Alignment.centerLeft,
                child: Container(
                  width: (patient == 'Jennie Kim')
                      ? (deviceSize.width - 48) * 0.6
                      : (deviceSize.width - 48) * 0.45,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Color(0xffCA5FFE),
                        Color(0xff3B95FF),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
