import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

class RecorderScreen extends StatefulWidget {
  const RecorderScreen({Key? key}) : super(key: key);

  @override
  State<RecorderScreen> createState() => _RecorderScreenState();
}

class _RecorderScreenState extends State<RecorderScreen> {
  final recorder = FlutterSoundRecorder();
  String? locationOfAudioFile;

  @override
  void initState() {
    super.initState();
    // initialize the recorder
    initializeRecorder();
  }

  Future initializeRecorder() async {
    locationOfAudioFile = '/sdcard/Download/${DateTime.now().microsecondsSinceEpoch}.wav';
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    await recorder.openRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future recordStop() async {
    await recorder.stopRecorder();
  }

  Future recordStart() async {
    //sets the path from the string
    Directory directory = Directory(path.dirname(locationOfAudioFile!));
    if (!directory.existsSync()) {
      directory.createSync();
    }
    await recorder.openRecorder();
    await recorder.startRecorder(
      toFile: locationOfAudioFile,
      codec: Codec.pcm16WAV,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              if (recorder.isRecording) {
                // need to stop
                //await
                await recordStop();
              } else {
                // need to start
                await recordStart();
              }
              setState(() {
                
              });
            },
            child: Icon(recorder.isRecording ? Icons.stop : Icons.mic),
          ),
        ],
      ),
    );
  }
}
