import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_improve/config/helpers/human_formats.dart';
import 'package:tiktok_improve/domain/entities/video_post.dart';

class VideoButtoms extends StatelessWidget {
  final VideoPost video;

  const VideoButtoms({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButtom(
          value: video.likes,
          iconColor: Colors.red,
          iconData: Icons.favorite,
        ),
        const SizedBox(
          height: 20.0,
        ),
        _CustomIconButtom(
          value: video.views,
          iconData: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(
          height: 20.0,
        ),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _CustomIconButtom(
            value: 0,
            iconData: Icons.play_circle_outline,
          ),
        ),
      ],
    );
  }
}

class _CustomIconButtom extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButtom({
    super.key,
    required this.value,
    required this.iconData,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            iconData,
            color: color,
            size: 30.0,
          ),
        ),
        if (value > 0)
          Text(
            HumanFormats.humanReadbleNumber(value.toDouble()),
          ),
      ],
    );
  }
}
