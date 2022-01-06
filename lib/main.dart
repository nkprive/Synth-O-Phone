import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // Note : Color
  var notes = {
    "C1": Colors.red,
    "C#1": Colors.blue,
    "D1": Colors.green,
    "D#1": Colors.amber,
    "E1": Colors.purple,
    "F1": Colors.pink,
    "F#1": Colors.red,
    "G1": Colors.blue,
    "G#1": Colors.green,
    "A1": Colors.amber,
    "A#1": Colors.purple,
    "B1": Colors.pink,
    "C2": Colors.red,
    "C#2": Colors.blue,
    "D2": Colors.green,
    "D#2": Colors.amber,
    "E2": Colors.purple,
    "F2": Colors.pink,
    "F#2": Colors.red,
    "G2": Colors.blue,
    "G#2": Colors.green,
    "A2": Colors.amber,
    "A#2": Colors.purple,
    "B2": Colors.pink,
    "C3": Colors.red,
  };

  playNote(note) {
    AudioCache player = AudioCache();
    final noteUnhashed = note.replaceFirst(RegExp('#'), 's');
    player.play('synth/$noteUnhashed.wav', volume: 2.0);
  }

  playBacking() {
    AudioCache player = AudioCache();
    player.play('backing/BackingTrackC.mp3', volume: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Synth-O-Phone'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.play_arrow),
          onPressed: () {
            playBacking();
          },
        ),
        body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            String note = notes.keys.elementAt(index);
            return Container(
              height: 100,
              color: notes[note],
              child: TextButton(
                onPressed: () {
                  playNote(note);
                },
                child: Text(
                  '$note',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ),
              // height: 50,
              // color: Colors.amber[colorCodes[index]],
              // child: Center(child: Text('Entry ${entries[index]}'),),
            );
          },
        ),
      ),
    );
  }
}
