import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  
  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key, 
    required this.videoUrl, 
    required this.caption,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();

  }

  @override
  void dispose() {
    _videoController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _videoController.initialize(),
      builder: (context, snapshot) {
        if( snapshot.connectionState != ConnectionState.done ){
          return const Center( child: CircularProgressIndicator(), );
        }

        return GestureDetector(
          onTap: () {

            if( _videoController.value.isPlaying ){
              _videoController.pause();
              return;
            }

            _videoController.play();

          },
          child: AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(_videoController),

                VideoBackground(),

                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption)
                )
              ],
            ),
          ),
        );
        
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;

  const _VideoCaption({
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
      ),
    );
  }
}