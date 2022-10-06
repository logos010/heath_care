// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/material.dart';
import '../Common/ColorPalette.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import 'congrat.dart';

class RecordPage extends StatefulWidget {
  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  final ImagePicker _picker = ImagePicker();
  VideoPlayerController? _controller;
  XFile? video;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  Future<void> getVideo(String source) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (source == 'camera') {
      final XFile? selectVideo = await _picker.pickVideo(
          source: ImageSource.camera,
          preferredCameraDevice: CameraDevice.front);
      print('path: ' + selectVideo!.path.toString());

      setState(() {
        video = selectVideo;
      });
    } else {
      final XFile? selectVideo =
          await _picker.pickVideo(source: ImageSource.gallery);
      print('path: ' + selectVideo!.path.toString());

      setState(() {
        video = selectVideo;
      });
    }
    _playVideo(video);
  }

  Future<void> _playVideo(XFile? file) async {
    if (file != null && mounted) {
      late VideoPlayerController controller;

      controller = VideoPlayerController.file(File(file.path));

      _controller = controller;

      await controller.setVolume(1);
      await controller.initialize();
      await controller.setLooping(false);
      await controller.play();
      setState(() {});
    }
  }

  void showVideoPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('Chose video'),
                    onTap: () {
                      getVideo('galery');
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Record video'),
                  onTap: () {
                    getVideo('camera');
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
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
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Congrat(),
                        ),
                      );
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColor.primary500),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.primary50),
                child: Center(child: Image.asset('assets/video.png')),
              ),
              SizedBox(height: 10),
              Text(
                'Press the RED button to record it.',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grayScale950),
              ),
              SizedBox(height: 20),
              Container(
                  width: deviceSize.width - 48,
                  height: deviceSize.height * 0.5,
                  color: AppColor.grayScale100,
                  child: (video != null)
                      ? AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        )
                      : Container()),
              Spacer(),
              GestureDetector(
                onTap: () {
                  showVideoPicker(context);
                },
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: AppColor.grayScale100,
                  ),
                  alignment: Alignment.center,
                  child: Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(52),
                        color: AppColor.red500,
                        border: Border.all(color: AppColor.grayScale00)),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
