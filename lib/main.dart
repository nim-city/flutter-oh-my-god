import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Oh My God!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  bool isOhVisible = false;
  bool isMyVisible = false;
  bool isGodVisible = false;

  bool isOMGVisible = true;
  bool isWowVisible = false;

  void _playOMG() async {
    setState(() {
      isOhVisible = false;
      isMyVisible = false;
      isGodVisible = false;
    });
    advancedPlayer.stop();
    audioCache.play("audio/oh_my_god_clipped.mp3");
    setState(() {
      isOhVisible = true;
    });
    Future.delayed(const Duration(milliseconds: 450), () {
      setState(() {
        isMyVisible = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        isGodVisible = true;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isOhVisible = false;
        isMyVisible = false;
        isGodVisible = false;
      });
    });
  }

  void _playWow() async {
    setState(() {
      isWowVisible = false;
    });
    advancedPlayer.stop();
    audioCache.play("audio/wow_clipped.mp3");
    setState(() {
      isWowVisible = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isWowVisible = false;
      });
    });
  }

  @override
  void initState() {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Image.asset("assets/images/oh_my_god_title_white.png"),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
//        width: MediaQuery.of(context).size.width,
//        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 200.0),
//                  padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                  child: MaterialButton(
                    onPressed: _playOMG,
                    child: Image(
                      image: AssetImage("assets/images/oh_my_god_clipped.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200.0, right: 50.0),
//                  padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                  child: MaterialButton(
                    onPressed: _playWow,
                    child: Image(
                      image: AssetImage("assets/images/wow_clipped.png"),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8.5),
                child: Column(
                  children: <Widget>[
                    isOhVisible ? Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 6,
                      child: Image(image: AssetImage("assets/images/oh.png")),
                    ) : Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 6,
                    ),
                    isMyVisible ? Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 6,
                      child: Image(image: AssetImage("assets/images/my.png")),
                    ) : Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 6,
                    ),
                    isGodVisible ? Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 6,
                      child: Image(image: AssetImage("assets/images/god!.png")),
                    ) : Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 6,
                    ),
                  ],
                ),
              ),
            ),
            isWowVisible ? Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 8),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.0,
                  height: MediaQuery.of(context).size.width / 2.0,
                  child: Image(image: AssetImage("assets/images/wow!.png")),
                ),
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
