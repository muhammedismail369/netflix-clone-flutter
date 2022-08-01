import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../home/widget/custom_button_widget.dart';
import '../../widgets/video_widget.dart';

Widget _buildEveryonesWatching() {
  return const SizedBox();
}

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kGreyColor,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(url: posterPath),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        letterSpacing: -2,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.alarm_on_rounded,
                        title: "Remind me",
                        iconSize: 20,
                        textSize: 14,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: "Info",
                        iconSize: 20,
                        textSize: 14,
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHeight,
              Text("Coming on $day $month"),
              kHeight,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(
                  color: kGreyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
