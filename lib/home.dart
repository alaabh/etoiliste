import 'package:etoiliste_bouhjar/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/etoiliste-bouhjar.appspot.com/o/video%2FFDownloader.net-233734149530771-(1080p).mp4?alt=media&token=326e2a6f-25c1-4f35-8811-0d734776b918'))
      ..initialize().then((_) {
        /*  Future.delayed(Duration(seconds: 3)).then((_) {
      controller.play();
      }); */
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        controller.setLooping(true);
        setState(() {});
      });

    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // mutes the video
      controller.setVolume(0);
      // Plays the video once the widget is build and loaded.
      controller.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.value.isInitialized
          ? Stack(
              children: <Widget>[
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller.value.size.width,
                      height: controller.value.size.height,
                      child: VideoPlayer(controller),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(
                      'Dhaker Ya3tik 3asba',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                    TableWidget(),
                  ],
                )
              ],
            )
          : Center(child: CircularProgressIndicator()),
      floatingActionButton: IconButton(
        onPressed: () {
          setState(() {
            controller.value.volume == 1
                ? controller.setVolume(0)
                : controller.setVolume(1);
          });
        },
        icon: Icon(
          controller.value.volume == 1
              ? Icons.volume_up
              : Icons.volume_off, // Use appropriate icons
        ),
      ),
    );
  }
}
