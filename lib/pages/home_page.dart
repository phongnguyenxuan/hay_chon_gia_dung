import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MyHomePageState());
  }
}

class MyHomePageState extends StatefulWidget {
  const MyHomePageState({Key? key}) : super(key: key);

  @override
  State<MyHomePageState> createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState> {
  final Uri _url = Uri.parse("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
  var randomX = new Random();
  var randomY = new Random();
  double x = 0;
  double y = -0.3;
  void _positionX() {
    setState(() {
      x = -1 + (1 + 1) * randomX.nextDouble();
      y = -1 + (1 + 1) * randomY.nextDouble();
    });
  }

//ham mo link
  Future<void> _launchURL() async {
    if (!await launchUrl(_url)) {
      throw 'khong the mo $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage("assets/rainbow.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 80)),
                  const Text(
                    "Bro bị gay hay không",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  const Text(
                    "(thằng nào thoát thằng đấy Gay !! )",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 80)),
                  ElevatedButton(
                      onPressed: _launchURL,
                      child: const Text(
                        "Ừ thì bố mày gay",
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          overlayColor:
                              MaterialStateProperty.all(Colors.greenAccent))),
                ],
              ),
            ),
            Align(
              alignment: Alignment(x, y),
              child: ElevatedButton(
                onPressed: _positionX,
                child: const Text(
                  "Đéo",
                  style: TextStyle(fontSize: 15),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    overlayColor: MaterialStateProperty.all(Colors.redAccent)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
