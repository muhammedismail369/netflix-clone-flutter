import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:netflix_app/core/colors/colors.dart';
// import 'package:netflix_app/core/constants.dart';
// import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

// import '../../application/downloads/downloads_bloc.dart';
import '../../application/downloads/downloads_bloc.dart';
import '../../core/colors/colors.dart';
import '../../core/constants.dart';
import '../widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartWidget(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: _widgetList.length,
        separatorBuilder: (ctx, index) => const SizedBox(
          height: 25,
        ),
        itemBuilder: (ctx, index) => _widgetList[index],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImages());
    });

    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing downloads for you.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "We will download a personalized selection of\n movies and shows for you, so there's\n something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(builder: (context, state) {
          print(context);
          return SizedBox(
            width: size.width,
            height: size.width,
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.4,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                      DownloadsImageWidget(
                        imageList:
                            '$imageAppendUrl${state.downloads[0].posterPath}',
                        margin: const EdgeInsets.only(
                          left: 150,
                          bottom: 50,
                        ),
                        angle: 20,
                        size: Size(size.width * 0.4, size.width * 0.58),
                      ),
                      DownloadsImageWidget(
                        imageList:
                            '$imageAppendUrl${state.downloads[1].posterPath}',
                        margin: const EdgeInsets.only(
                          right: 150,
                          bottom: 50,
                        ),
                        angle: -20,
                        size: Size(size.width * 0.4, size.width * 0.58),
                      ),
                      DownloadsImageWidget(
                        imageList:
                            '$imageAppendUrl${state.downloads[2].posterPath}',
                        margin: const EdgeInsets.only(left: 0),
                        size: Size(size.width * 0.45, size.width * 0.65),
                      ),
                    ],
                  ),
          );
        }),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can download',
              style: TextStyle(
                color: kBlackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartWidget extends StatelessWidget {
  const _SmartWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            )),
      ),
    );
  }
}
