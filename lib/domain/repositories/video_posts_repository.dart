import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostRepository {
  
  Future<List<VideoPost>> getTrendingVideosByPage([ int page = 1 ]);
  Future<List<VideoPost>> getFavoriteVideosByUser( String userId );

}