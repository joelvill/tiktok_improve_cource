import 'package:flutter/material.dart';

import '../../domain/entities/video_post.dart';
import '../../domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostRepository videoPostRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoPostRepository});

  Future<void> loadNextPage() async {
    // final List<VideoPost> newVideos = videoPosts
    //     .map(
    //       (video) => LocalVideoModel.fromJson(video).toVideoPostEntity(),
    //     )
    //     .toList();

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
