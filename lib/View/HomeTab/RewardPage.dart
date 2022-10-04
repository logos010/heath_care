// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../Common/ColorPalette.dart';

class RewardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
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
                SizedBox(height: 32),
                cardPoints(context),
                SizedBox(height: 32),
                Text('Ranking',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grayScale950)),
                SizedBox(height: 24),
                rankingPoint(context),
                SizedBox(height: 10),
                rankingCount(),
                SizedBox(height: 24),
                Text('Rewards',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grayScale950)),
                SizedBox(height: 16),
                Container(
                  width: deviceSize.width - 48,
                  height: 132,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg_white.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.grayScale100,
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.yellow100),
                          child: Center(
                              child: Image.asset('assets/star_medium.png')),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Massage machine',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.grayScale950)),
                            SizedBox(height: 5),
                            Text('Mini massage machine',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.grayScale600)),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: deviceSize.width * 0.5,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColor.grayScale100,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: deviceSize.width * 0.5 * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                SizedBox(width: 10),
                                Text('25/50',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.grayScale600))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: deviceSize.width - 48,
                  height: 132,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg_white.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.grayScale100,
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.red100),
                          child:
                              Center(child: Image.asset('assets/voucher.png')),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Kitchen voucher',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.grayScale950)),
                            SizedBox(height: 5),
                            Text('20% discount of Blender machine',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.grayScale600)),
                            Spacer(),
                            Container(
                              width: deviceSize.width - 138,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Spacer(),
                                  Container(
                                    // width: 105,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColor.primary500),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Claim Reward',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.grayScale00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  width: deviceSize.width - 48,
                  height: 132,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg_white.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.grayScale100,
                        blurRadius: 5,
                        spreadRadius: 3,
                        offset: Offset(4, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColor.secondary100),
                          child: Center(child: Image.asset('assets/spa.png')),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Spa massage',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.grayScale950)),
                            SizedBox(height: 5),
                            Text('2 premium tickets at XXX Spa',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.grayScale600)),
                            Spacer(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: deviceSize.width * 0.5,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColor.grayScale100,
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    width: deviceSize.width * 0.5 * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                SizedBox(width: 10),
                                Text('25/50',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.grayScale600))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Row(
      children: [
        Text('Rewards',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColor.grayScale950)),
        Spacer(),
        Image.asset('assets/notification.png'),
        SizedBox(width: 20),
        CircleAvatar(
          radius: 20.0,
          backgroundImage: NetworkImage('https://picsum.photos/200/300'),
          backgroundColor: Colors.transparent,
        )
      ],
    );
  }

  Widget cardPoints(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Container(
      width: deviceSize.width - 48,
      height: 76,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/reward_card.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/star_big.png'),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Medire Point',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grayScale00),
                ),
                Text(
                  '271 points',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColor.grayScale00),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget rankingPoint(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 2,
                height: 48,
                color: AppColor.grayScale100,
              ),
              Container(
                width: 2,
                height: 48,
                color: AppColor.grayScale100,
              ),
              Container(
                width: 2,
                height: 48,
                color: AppColor.grayScale100,
              )
            ],
          ),
        ),
        Container(
          width: deviceSize.width - 48,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.grayScale100,
          ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: deviceSize.width * 0.4,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
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
    );
  }

  Widget rankingCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bronze.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              '1',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColor.yellow500),
            ),
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/silver.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              '2',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primary500),
            ),
          ),
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/gold.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              '3',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColor.secondary500),
            ),
          ),
        ),
      ],
    );
  }
}
