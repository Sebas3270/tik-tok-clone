import 'package:toktik/domain/datasource/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImplementation extends VideoPostRepository {

  final VideoPostDatasource videosDatasource;

  VideoPostsRepositoryImplementation({
    required this.videosDatasource,
  });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    // TODO: implement getFavoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage([int page = 1]) {
    return videosDatasource.getTrendingVideosByPage(page);
  }

}