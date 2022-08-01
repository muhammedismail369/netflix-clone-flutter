import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widget/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;

  const EveryonesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          'The Roundup (2022)',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "Followed by Ma Seok-do, who heads to a foreign country to extradite a suspect. However, he discovers additional murder cases and learns about a killer who had committed crimes against tourists for many years",
          style: TextStyle(
            color: kGreyColor,
          ),
        ),
        kHeight50,
        const VideoWidget(url: newAndHotTempImage),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              textSize: 18,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 25,
              textSize: 18,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 25,
              textSize: 18,
            ),
            kWidth,
          ],
        ),
      ],
    );
  }
}
