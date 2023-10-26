import 'package:flutter/material.dart';
import 'package:video_call/gitIgnore.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;
  final String userID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
    required this.userID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: ZegoUIKitPrebuiltVideoConference(
        appID: appID, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userID,
        userName: 'user $userID',
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(
          turnOnCameraWhenJoining: false,
          turnOnMicrophoneWhenJoining: false,
        ),
      ),

    );
  }
}