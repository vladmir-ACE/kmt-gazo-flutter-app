import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';

class SongPage extends StatefulWidget {
  final int index;
  final String titre;

  const SongPage({super.key, required this.titre, required this.index});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool playing = false;
  IconData playbtn = Icons.play_arrow;
  AudioPlayer player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    player.onDurationChanged.listen((state) {
      setState(() {
        duration = state;
      });

      player.onPositionChanged.listen((state) {
        position = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.titre,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 35,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          size: 40,
          color: Colors.orange,
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              child: Lottie.asset('assets/musique.json'),
            ),
            Text(
              widget.titre,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 35,
              ),
            ),
            Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await player.seek(position);

                  await player.resume();
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                      "${position.inMinutes}:${(position.inSeconds % 60).toString().padLeft(2, '0')}"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Text(
                      "${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous),
                    iconSize: 45,
                    color: Colors.blue,
                  ),
                  IconButton(
                    onPressed: () async {
                      if (!playing) {
                        setState(() {
                          final int i = widget.index + 1;
                          playbtn = Icons.pause;
                          player.play(AssetSource('GAZO/$i.m4a'));
                          playing = true;
                        });
                      } else {
                        setState(() {
                          playbtn = Icons.play_arrow;
                          player.pause();
                          playing = false;
                        });
                      }
                    },
                    icon: Icon(playbtn),
                    iconSize: 65,
                    color: Colors.blue[800],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next),
                    iconSize: 45,
                    color: Colors.blue,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
