import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Home.dart';
import 'liste.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/logo.json'),
              Text(
                "LA MALA EST \n \t   GANGS ",
                style: TextStyle(color: Colors.orange, fontSize: 30),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Liste(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.orange,
                        onPrimary: Colors.white),
                    child: Text(
                      'START KMT',
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          )),
    );
  }
}
