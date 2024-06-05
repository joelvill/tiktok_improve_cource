import 'package:flutter/material.dart';
import 'package:tiktok_improve/presentation/widgets/videos/fullscreen_player.dart';

import '../../../domain/entities/video_post.dart';
import 'video_buttoms.dart';

class VideoScrolleableView extends StatelessWidget {
  const VideoScrolleableView({
    super.key,
    required this.videos,
  });

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        return Stack(
          children: [
            // Video player + gradient
            SizedBox.expand(
              child: FullScreenPlayer(
                videoUrl: videoPost.videoUrl,
                caption: videoPost.caption,
              ),
            ),
            // Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtoms(
                video: videoPost,
              ),
            )
          ],
        );
      },
    );
  }
}
