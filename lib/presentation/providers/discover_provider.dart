import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videoRepository;

  DiscoverProvider({
    required this.videoRepository,
  });

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async{

    final newVideos = await videoRepository.getTrendingVideosByPage();

    videos.addAll(newVideos);

    initialLoading = false;
    notifyListeners();
  } 

}