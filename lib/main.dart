import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_improve/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tiktok_improve/infrastructure/repositories/video_posts_repository_impl.dart';

import 'config/theme/app_theme.dart';
import 'presentation/providers/discover_provider.dart';
import 'presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(
      videoPostsDatasource: LocalVideoDataSource(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) =>
              DiscoverProvider(videoPostRepository: videoPostRepository)
                ..loadNextPage(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
