// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_call/video_chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();
    String userrandomID = generateRandomId();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Video Conference"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              String conferenceID = generateRandomId();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoConferencePage(
                    conferenceID: conferenceID,
                    userID: userrandomID,
                  ),
                ),
              );
            },
            child: Text("New Meeting"),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter Meeting ID',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          _textController.text.length == 6
              ? SizedBox()
              : TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoConferencePage(
                            conferenceID: _textController.text,
                            userID: userrandomID,
                          ),
                        ));
                  },
                  child: Text("Join"))
        ],
      ),
    );
  }

  String generateRandomId() {
    const chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    final random = Random();
    String id = "";

    for (int i = 0; i < 6; i++) {
      id += chars[random.nextInt(chars.length)];
    }

    return id;
  }
}

// VideoConferencePage
