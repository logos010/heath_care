// ignore_for_file: prefer_const_constructors

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../Common/ColorPalette.dart';

class ScanPage extends StatefulWidget {
  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  int _currentIndex = 0;
  Barcode? result;
  QRViewController? controller;
  late PageController _pageController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded)),
              SizedBox(height: 20),
              (_currentIndex == 0)
                  ? Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        // color: Colors.red,
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.primary50,
                              ),
                              child: Center(
                                  child: Image.asset('assets/focus.png')),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Scan QR code',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grayScale950),
                            ),
                            SizedBox(height: 20),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                child: QRView(
                                  key: qrKey,
                                  onQRViewCreated: _onQRViewCreated,
                                  overlay: QrScannerOverlayShape(
                                      borderColor: AppColor.primary500,
                                      borderRadius: 10,
                                      borderLength: 30,
                                      borderWidth: 10,
                                      cutOutSize: scanArea),
                                  onPermissionSet: (ctrl, p) =>
                                      _onPermissionSet(context, ctrl, p),
                                )),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.primary50,
                              ),
                              child: Center(
                                  child: Image.asset('assets/focus.png')),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Scan code to check-in',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grayScale950),
                            ),
                            SizedBox(height: 20),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  color: AppColor.grayScale50,
                                  child: Center(
                                    child: Image.asset(
                                      'assets/qr_example.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 88,
                                  height: 88,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColor.grayScale00,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset('assets/Logo.png'),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: AppColor.grayScale00,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        containerHeight: 70,
        itemCornerRadius: 16,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        showElevation: true,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text(
              'scan QR',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            textAlign: TextAlign.center,
            activeColor: AppColor.primary500,
            inactiveColor: AppColor.grayScale950,
            icon: Image.asset('assets/scan_qr.png'),
          ),
          BottomNavyBarItem(
            title: Text(
              'My QR',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            textAlign: TextAlign.center,
            activeColor: AppColor.primary500,
            inactiveColor: AppColor.grayScale950,
            icon: Image.asset(
              'assets/my_qr.png',
              color: AppColor.primary500,
            ),
          ),
        ],
      ),
    );
  }
}
