import 'package:flutter/material.dart';
import 'package:kmt/SongPage.dart';

class Liste extends StatefulWidget {
  const Liste({super.key});

  @override
  State<Liste> createState() => _ListeState();
}

class _ListeState extends State<Liste> {
  final List<String> titre = <String>[
    'BECTE',
    'BODIES(FEAT.DAMSO)',
    'LETTRE A UN OPPS',
    'RAPPEL',
    'JEUX DANGEREUX',
    'M.A.L.A (FEAT. M HUNCHO)',
    'GRA GRA BOOM(feat.skread)',
    'HENNESSY',
    'IMPACT',
    'DIE',
    'BOSS',
    'CELINE 3X',
    'MOLLY',
    'FLEURS',
    'MAUVAIS 2X'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: const Text(
            "GAZO-KMT",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                child: Text(
                  "KMT-SONG",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.separated(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 3),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image(
                            image: AssetImage('assets/images/BSB.png'),
                          ),
                          //const CircleAvatar(
                          //   backgroundImage:
                          //       AssetImage('assets/images/BSB.jpg'),
                          //   radius: 50,
                          // ),
                          title: Text("${titre[index]}"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SongPage(
                                      titre: titre[index], index: index),
                                ));
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                            color: Colors.blue,
                            height: 20,
                          ),
                      itemCount: titre.length),
                ),
              ),
            ],
          ),
        ));
  }
}
