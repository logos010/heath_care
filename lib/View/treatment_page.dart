// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:table_calendar/table_calendar.dart';
import '../Common/ColorPalette.dart';

class TreatmentPage extends StatefulWidget {
  @override
  State<TreatmentPage> createState() => _TreatmentPageState();
}

class _TreatmentPageState extends State<TreatmentPage> {
  String treatment = 'Take medicines';
  String doctor = '';
  String place = '';
  List<String> doctors = [
    'Chris Evans',
    'Scarlett Johansson',
    'Chris Hemsworth',
    'Mark Ruffalo',
    'Jeremy Renner',
    'Elizabeth Olsen',
    'Tom Holland'
  ];
  List<String> places = [
    'Building 2, Flr 1, Room 01',
    'Building 2, Flr 1, Room 02',
    'Building 2, Flr 1, Room 03',
    'Building 2, Flr 1, Room 04',
    'Building 2, Flr 1, Room 05',
    'Building 2, Flr 1, Room 06',
    'Building 2, Flr 1, Room 07',
    'Building 2, Flr 1, Room 08',
    'Building 2, Flr 1, Room 09',
  ];

  bool isShowCalendar = false;

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                appBar(),
                SizedBox(height: 28),
                treatmentCard(),
                SizedBox(height: 16),
                DottedLine(dashColor: AppColor.grayScale100),
                SizedBox(height: 16),
                selectTimeCard(),
                Visibility(
                  visible: isShowCalendar,
                  child: selectTimeContent(),
                ),
                SizedBox(height: 16),
                DottedLine(dashColor: AppColor.grayScale100),
                SizedBox(height: 16),
                Visibility(
                  visible: treatment == 'Physical therapy',
                  child: selectDoctorCard(),
                ),
                Visibility(
                  visible: treatment != 'Take medicines',
                  child: selectPlaceCard(),
                ),
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
          icon: Image.asset('assets/down.png'),
        ),
        Text(
          'New treatments',
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
          ),
        )
      ],
    );
  }

  Widget treatmentCard() {
    var deviceSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => showMaterialModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        elevation: 16,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 338,
              width: deviceSize.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColor.grayScale00),
              child: Column(children: [
                SizedBox(height: 18),
                Container(
                  width: 88,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColor.grayScale400,
                  ),
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      treatment = 'Take medicines';
                      Navigator.pop(context);
                    });
                    updateState();
                  },
                  child: Container(
                    width: deviceSize.width - 48,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: (treatment == 'Take medicines')
                          ? AppColor.primary50
                          : AppColor.grayScale00,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColor.primary500,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/pill.png',
                              color: AppColor.grayScale00,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Take medicines',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.grayScale950),
                        ),
                        Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                                color: AppColor.primary500, width: 2),
                          ),
                          child: Visibility(
                            visible: treatment == 'Take medicines',
                            child: Center(
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppColor.primary500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      treatment = 'Do exercise';
                      Navigator.pop(context);
                      updateState();
                    });
                  },
                  child: Container(
                    width: deviceSize.width - 48,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: (treatment == 'Do exercise')
                          ? AppColor.primary50
                          : AppColor.grayScale00,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColor.secondary500,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/Barbell.png',
                              color: AppColor.grayScale00,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Do exercise',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.grayScale950),
                        ),
                        Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                                color: AppColor.primary500, width: 2),
                          ),
                          child: Visibility(
                            visible: treatment == 'Do exercise',
                            child: Center(
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppColor.primary500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      treatment = 'Physical therapy';
                      Navigator.pop(context);
                    });
                    updateState();
                  },
                  child: Container(
                    width: deviceSize.width - 48,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: (treatment == 'Physical therapy')
                          ? AppColor.primary50
                          : AppColor.grayScale00,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColor.yellow500,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/scope.png',
                              color: AppColor.grayScale00,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Physical therapy',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.grayScale950),
                        ),
                        Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                                color: AppColor.primary500, width: 2),
                          ),
                          child: Visibility(
                            visible: treatment == 'Physical therapy',
                            child: Center(
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: AppColor.primary500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                )
              ]),
            );
          });
        },
      ),
      child: Container(
        width: deviceSize.width - 48,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.grayScale50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: (treatment == 'Take medicines')
                    ? AppColor.primary500
                    : (treatment == 'Do exercise')
                        ? AppColor.secondary500
                        : AppColor.yellow500,
              ),
              child: Center(
                child: Image.asset(
                  (treatment == 'Take medicines')
                      ? 'assets/pill.png'
                      : (treatment == 'Do exercise')
                          ? 'assets/Barbell.png'
                          : 'assets/scope.png',
                  color: AppColor.grayScale00,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              treatment,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColor.grayScale950),
            ),
            Spacer(),
            Image.asset('assets/down.png')
          ]),
        ),
      ),
    );
  }

  Widget selectTimeCard() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColor.grayScale50),
          child: Center(child: Icon(Icons.timer_sharp)),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select time',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.grayScale600),
            ),
            Text(
              '12:00 - 13:00 Today',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.primary500),
            )
          ],
        ),
        Spacer(),
        CupertinoSwitch(
          value: isShowCalendar,
          onChanged: (value) {
            setState(() {
              isShowCalendar = value;
            });
          },
        ),
      ],
    );
  }

  Widget selectTimeContent() {
    var deviceSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start:',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grayScale950),
                ),
                SizedBox(height: 8),
                Container(
                  width: (deviceSize.width - 48) / 2 - 8,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.grayScale50,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: (deviceSize.width - 48) / 2 - 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.grayScale00,
                        ),
                        child: Center(
                            child: Text(
                          ':',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.grayScale950),
                        )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int i = 0; i < 23; i++)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(32, 16, 0, 0),
                                    child: Text(
                                      (i < 9) ? '0' + i.toString() : '$i',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.grayScale950),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int i = 0; i < 60; i++)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 16, 32, 0),
                                    child: Text(
                                      (i < 9) ? '0' + i.toString() : '$i',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.grayScale950),
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End:',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.grayScale950),
                ),
                SizedBox(height: 8),
                Container(
                  width: (deviceSize.width - 48) / 2 - 8,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColor.grayScale50,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: (deviceSize.width - 48) / 2 - 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.grayScale00,
                        ),
                        child: Center(
                            child: Text(
                          ':',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.grayScale950),
                        )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int i = 0; i < 23; i++)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(32, 16, 0, 0),
                                    child: Text(
                                      (i < 9) ? '0' + i.toString() : '$i',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.grayScale950),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                for (int i = 0; i < 60; i++)
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 16, 32, 0),
                                    child: Text(
                                      (i < 9) ? '0' + i.toString() : '$i',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.grayScale950),
                                    ),
                                  )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 16),
        Text(
          'Day:',
          style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColor.grayScale950),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColor.grayScale50,
          ),
          child: TableCalendar(
            firstDay: DateTime(DateTime.now().year - 5, 1, 1),
            lastDay: DateTime(DateTime.now().year + 5, 1, 1),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
          ),
        )
      ],
    );
  }

  Widget selectDoctorCard() {
    var deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: () => showMaterialModalBottomSheet(
            expand: false,
            context: context,
            backgroundColor: Colors.transparent,
            elevation: 16,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: deviceSize.height - 120,
                  width: deviceSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.grayScale00),
                  child: Column(children: [
                    SizedBox(height: 18),
                    Container(
                      width: 88,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColor.grayScale400,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: deviceSize.width - 48,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Expanded(
                        child: ListView.builder(
                            itemCount: doctors.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    doctor = doctors[index];
                                  });
                                  updateState();
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 10, 24, 0),
                                  child: Container(
                                    width: deviceSize.width - 48,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: (doctor == doctors[index])
                                          ? AppColor.primary50
                                          : Colors.transparent,
                                    ),
                                    // ignore: prefer_const_literals_to_create_immutables
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      child: Row(children: [
                                        CircleAvatar(
                                          radius: 25.0,
                                          backgroundImage: NetworkImage(
                                              'https://picsum.photos/id/237/200/300'),
                                          backgroundColor: Colors.transparent,
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              doctors[index],
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: AppColor.grayScale950,
                                              ),
                                            ),
                                            Text(
                                              'Physiotherapist',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.grayScale500,
                                              ),
                                            )
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                                color: AppColor.primary500,
                                                width: 2),
                                          ),
                                          child: Center(
                                            child: Visibility(
                                              visible: doctor == doctors[index],
                                              child: Container(
                                                width: 14,
                                                height: 14,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  color: AppColor.primary500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            }))
                  ]),
                );
              });
            },
          ),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.grayScale50),
                  child: Center(
                    child: Image.asset(
                      'assets/doctor.png',
                      color: AppColor.grayScale950,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select doctor',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.grayScale600),
                    ),
                    Visibility(
                      visible: doctor != '',
                      child: Text(
                        doctor,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.primary500),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Image.asset('assets/down.png'),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        DottedLine(dashColor: AppColor.grayScale100),
      ],
    );
  }

  Widget selectPlaceCard() {
    var deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: 16),
        GestureDetector(
          onTap: () => showMaterialModalBottomSheet(
            expand: false,
            context: context,
            backgroundColor: Colors.transparent,
            elevation: 16,
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                  height: deviceSize.height - 120,
                  width: deviceSize.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColor.grayScale00),
                  child: Column(children: [
                    SizedBox(height: 18),
                    Container(
                      width: 88,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColor.grayScale400,
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: deviceSize.width - 48,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Expanded(
                        child: ListView.builder(
                            itemCount: places.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    place = places[index];
                                  });
                                  updateState();
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 10, 24, 0),
                                  child: Container(
                                    width: deviceSize.width - 48,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: (place == places[index])
                                          ? AppColor.primary50
                                          : Colors.transparent,
                                    ),
                                    // ignore: prefer_const_literals_to_create_immutables
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      // ignore: prefer_const_literals_to_create_immutables
                                      child: Row(children: [
                                        Container(
                                          width: 48,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: (place == places[index])
                                                ? AppColor.primary100
                                                : AppColor.grayScale50,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Center(
                                              child: Image.asset(
                                            'assets/location.png',
                                            color: (place == places[index])
                                                ? AppColor.primary500
                                                : AppColor.grayScale950,
                                          )),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          places[index],
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.grayScale950,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: 24,
                                          height: 24,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            border: Border.all(
                                                color: AppColor.primary500,
                                                width: 2),
                                          ),
                                          child: Center(
                                            child: Visibility(
                                              visible: place == places[index],
                                              child: Container(
                                                width: 14,
                                                height: 14,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                  color: AppColor.primary500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            }))
                  ]),
                );
              });
            },
          ),
          child: Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.grayScale50),
                  child: Center(
                    child: Image.asset(
                      'assets/location.png',
                      color: AppColor.grayScale950,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select place',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.grayScale600),
                    ),
                    Visibility(
                      visible: place != '',
                      child: Text(
                        place,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.primary500),
                      ),
                    )
                  ],
                ),
                Spacer(),
                Image.asset('assets/down.png'),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        DottedLine(dashColor: AppColor.grayScale100),
      ],
    );
  }
}
