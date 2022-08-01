import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/constants.dart';
import '../widgets/main_title_card.dart';
import 'widget/background_card.dart';
import 'widget/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (BuildContext context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                print(direction);
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: const [
                      BackgroundCard(),
                      kHeight,
                      MainTitleCard(
                        title: "Released in the past year",
                      ),
                      kHeight,
                      MainTitleCard(
                        title: "Trending Now",
                      ),
                      kHeight,
                      NumberTitleCard(),
                      kHeight,
                      MainTitleCard(
                        title: "Tense Drama",
                      ),
                      kHeight,
                      MainTitleCard(
                        title: "South Indian cinemas",
                      ),
                      kHeight,
                    ],
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    "https://proofmart.com/wp-content/uploads/2021/06/598-2-1-1536x1024.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                  ),
                                  kWidth,
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.blue,
                                  ),
                                  kWidth,
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('TV Shows', style: kHomeTitleText),
                                  Text(
                                    'Movies',
                                    style: kHomeTitleText,
                                  ),
                                  Text(
                                    'Categories',
                                    style: kHomeTitleText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : kHeight,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
