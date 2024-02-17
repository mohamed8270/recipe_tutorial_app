import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_tutorial_app/constants/theme.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeScreen extends StatefulWidget {
  final String YTurl;
  final String des;

  const YouTubeScreen({
    super.key,
    required this.YTurl,
    required this.des,
  });

  @override
  State<YouTubeScreen> createState() => _YouTubeScreenState();
}

class _YouTubeScreenState extends State<YouTubeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  bool _isPlayerReady = false;
  late String videoId;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.YTurl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Fwhite,
      appBar: AppBar(
        backgroundColor: Fwhite,
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            navigator!.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Fgreen,
            size: 26,
          ),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'FOOD',
                style: GoogleFonts.poppins(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Fgreen,
                ),
              ),
              TextSpan(
                text: 'DOOR',
                style: GoogleFonts.poppins(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
              child: Text(
                "Welcome Foodie! 😋",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange,
                ),
              ),
            ),
            const Gap(10),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Fgrey,
              ),
              child: VisibilityDetector(
                key: const Key("unique key"),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction == 0) {
                    _controller.pause();
                  } else {
                    _controller.value.isPlaying
                        ? _controller.play()
                        : _controller.pause();
                  }
                },
                child: YoutubePlayerBuilder(
                  onExitFullScreen: () {
                    // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
                    SystemChrome.setPreferredOrientations(
                        DeviceOrientation.values);
                  },
                  player: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Fgreen,
                    topActions: <Widget>[
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          _controller.metadata.title,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Fblack,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                    onReady: () {
                      _controller.addListener(listener);
                    },
                    onEnded: (data) {},
                  ),
                  builder: (context, player) => Scaffold(
                    key: _scaffoldKey,
                    body: ListView(
                      children: [
                        player,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Gap(15),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Text(
                "Let's Make it!",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Fblack,
                ),
              ),
            ),
            const Gap(5),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Text(
                widget.des.toString(),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Fblack.withOpacity(0.3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
