import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late YoutubePlayerController ytController;
  TextEditingController linkController = TextEditingController();
  double _top = 0;
  double _right = 0;
  double _width = 1;
  double _height = 1;
  Color _color = Colors.transparent;

  @override
  void initState() {
    ytController = YoutubePlayerController(
      initialVideoId: "OOHr8cn2Z0g",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        isLive: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 400,
          height: 700,
          color: Colors.white,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Positioned(
                top: 50,
                left: 5,
                child: YoutubePlayer(
                  width: 350,
                  controller: ytController,
                  liveUIColor: Colors.amber,
                ),
              ),
              Positioned(
                top: 270,
                child: Container(
                  height: 60,
                  width: 400,
                  child: TextFormField(
                    controller: linkController,
                    decoration: const InputDecoration(hintText: "Paste link"),
                  ),
                ),
              ),
              Positioned(
                top: 350,
                child: GestureDetector(
                  onTap: () {
                    ytController.load(
                      YoutubePlayer.convertUrlToId(linkController.text)!,
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    color: Colors.blueGrey,
                    child: const Center(
                      child: Text('Load Video'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 410,
                child: GestureDetector(
                  onTap: () {
                    linkController.clear();
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    color: Colors.blueGrey,
                    child: const Center(
                      child: Text('Clear'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: _top,
                right: _right,
                child: Container(
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                    color: _color,
                  ),
                ),
              ),
              Positioned(
                top: 350,
                left: 130,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _top = 50;
                      _right = 0;
                      _width = 450;
                      _height = 200;
                      _color = Colors.red.withOpacity(0.5);
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    color: Colors.blueGrey,
                    child: const Center(
                      child: Text('Overlay ON'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 410,
                left: 130,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _top = 1;
                      _right = 1;
                      _width = 1;
                      _height = 1;
                      _color = Colors.transparent;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    color: Colors.blueGrey,
                    child: const Center(
                      child: Text('Overlay OFF'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
