import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];

        return Stack(
          children: [
            //Video Player + gradiente
            // FullScreenPlayer( video: videoPost ),
            SizedBox.expand(
              child: FullScreenPlayer( 
                caption: videoPost.caption,
                videoUrl: videoPost.videoUrl,
              ),
            ),

            //Botones
            Positioned(
              bottom: 20,
              right: 20,
              child: VideoButtons(video: videoPost)
            ),
          ],
        );
      },
    );
  }
}